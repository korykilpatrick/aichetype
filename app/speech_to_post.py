import os
import openai
from pydub import AudioSegment
from pydub.playback import play
from pydub.silence import split_on_silence

from env import OPENAI_API_KEY, VOICE_MEMO_PATH

# TODO - take system msg as optional input. need to be able to tell it what the tone of the audio should be
openai.api_key = OPENAI_API_KEY
# GPT_MODEL = 'gpt-3.5-turbo'
GPT_MODEL = 'gpt-4'
SYSTEM_MSG = """Take the following semi-coherent stream of consciousness audio transcription and refine it. Stay true to the original content and voice, but polish it into a well-structured and clear blog post format. Your response should be formatted as React JSX code. Use hyperlinks when possible and useful. Use react-bootstrap for styling to make the post interactive or visually appealing when appropriate. If additional libraries or styling is needed, please include instructions on how to install and run them"""

# WHISPER threshold in bytes (25MB in bytes)
WHISPER_THRESHOLD = 25 * 1024 * 1024

import subprocess

def raw_split_audio(audio_file_path, threshold=25*1024*1024):  # Default threshold set to 25 MB
    sound = AudioSegment.from_file(audio_file_path, format="m4a")
    total_duration = len(sound)  # Get total duration in milliseconds
    
    file_size = os.path.getsize(audio_file_path)
    
    # If the file size is less than the threshold, simply return the original file
    if file_size <= threshold:
        return [audio_file_path]
    
    num_splits = -(-file_size // threshold)  # Calculate the number of splits, ceiling division
    duration_per_split = total_duration / num_splits  # Divide the total duration by the number of splits
    
    chunk_paths = []
    
    # Use ffmpeg to split the audio
    for i in range(num_splits):
        start_time = i * duration_per_split / 1000.0  # Convert to seconds
        duration = duration_per_split / 1000.0  # Convert to seconds
        chunk_path = f"chunk_{i+1}.m4a"
        input('writing chunk')
        command = f"ffmpeg -i {audio_file_path} -ss {start_time} -t {duration} -c copy {chunk_path}"
        subprocess.call(command, shell=True)
        chunk_paths.append(chunk_path)
        
    return chunk_paths


def transcribe_audio_chunks_to_whisper(chunk_paths):
    transcripts = []
    for path in chunk_paths:
        with open(path, "rb") as audio_file:
            print('getting a chunk of size', os.path.getsize(path))
            transcript = openai.Audio.transcribe("whisper-1", audio_file)
            input(transcript['text'])
            transcripts.append(transcript['text'])
    return ' '.join(transcripts)

def transcribe_audio(audio_file_path):
    filename = audio_file_path.split('/')[-1].split('.')[0]
    file_size = os.path.getsize(audio_file_path)
    if file_size <= WHISPER_THRESHOLD:
        input('small enough')
        audio_file= open(audio_file_path, "rb")
        transcription = openai.Audio.transcribe("whisper-1", audio_file)
        transcript =  transcription['text']
    else:
        # Find silence points and extract audio chunks
        chunk_paths = raw_split_audio(audio_file_path)
        # Transcribe chunks and concatenate results
        transcript = transcribe_audio_chunks_to_whisper(chunk_paths)
        # delete chunk paths
        for path in chunk_paths:
            os.remove(path)
    
    return transcript


def polish_transcription(transcript):
    response = openai.ChatCompletion.create(
    model=GPT_MODEL,
    messages=[
        {"role": "system", "content": SYSTEM_MSG},
        {"role": "user", "content": transcript}
    ]
    )
    print('usage', response['usage'])
    return response['choices'][0]['message']['content']

def voice_to_blog_post(file_path):
    filename = file_path.split('/')[-1].split('.')[0]
    raw_transcript = transcribe_audio(file_path)
    with open(f"{filename}_transcript.txt", 'w') as f:
        f.write(raw_transcript)

    input('Press enter to polish the transcription w/ gpt')
    polished_post = polish_transcription(raw_transcript)
    return polished_post

if __name__ == '__main__':
    filename = 'mac_miller'
    file_extension = 'm4a'
    file_path = f"{VOICE_MEMO_PATH}/{filename}.{file_extension}"
    # input(f'Press enter to transcribe {filename}')
    blog_post = voice_to_blog_post(file_path)
    with open(f'{filename}.txt', 'w') as f:
        f.write(blog_post)
