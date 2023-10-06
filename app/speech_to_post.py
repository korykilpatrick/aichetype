import openai

from env import OPENAI_API_KEY, VOICE_MEMO_PATH
openai.api_key = OPENAI_API_KEY
GPT_MODEL = 'gpt-4'
# GPT_MODEL = 'gpt-3.5-turbo'
SYSTEM_MSG = """Take the following semi-coherent stream of consciousness audio transcription and refine it. Stay true to the original content and voice, but polish it into a well-structured and clear blog post format. Your response should be formatted as React JSX code. Use hyperlinks when possible and useful. Use react libraries and styling to make the post interactive or visually appealing when appropriate. If additional libraries or styling is needed, please include instructions on how to install and run them"""

def transcribe_audio(audio_file_path):
    audio_file= open(audio_file_path, "rb")
    transcript = openai.Audio.transcribe("whisper-1", audio_file)
    # write transcript to file
    with open('transcript.txt', 'w') as f:
        f.write(transcript['text'])
    return transcript['text']

# Function to polish the transcript
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

# Main Function
def voice_to_blog_post(file_path):
    # raw_transcription = transcribe_audio(file_path)
    # read from file
    raw_transcription = ''
    with open('transcript.txt', 'r') as f:
        raw_transcription = f.read()
    input('Press enter to polish the transcription w/ gpt')
    polished_post = polish_transcription(raw_transcription)
    return polished_post


if __name__ == '__main__':
    filename = 'Intro'
    file_extension = 'm4a'
    file_path = f"{VOICE_MEMO_PATH}/{filename}.{file_extension}"
    input(f'Press enter to transcribe {filename}')
    blog_post = voice_to_blog_post(file_path)
    with open(f'{filename}.txt', 'w') as f:
        f.write(blog_post)
