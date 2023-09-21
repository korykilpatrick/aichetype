from pathlib import Path
from termcolor import cprint
from langchain.text_splitter import CharacterTextSplitter
import faiss
from langchain.vectorstores import FAISS
from langchain.embeddings import OpenAIEmbeddings
import pickle
from langchain import OpenAI, LLMChain
from langchain.prompts import Prompt
import time

file_path = Path(__file__).resolve()
curr_dir = file_path.parent
import sys
sys.path.append(str(file_path.parents[2]))
from env import OPENAI_API_KEY
sys.path.pop()
sys.path.append(str(curr_dir))

import os
os.environ['OPENAI_API_KEY'] = OPENAI_API_KEY

def train():
    training_data = list("training/gdocs/".glob("**/*.*"))
    data = []
    for training in training_data:
        with open(training, "r") as f:
            cprint(f"Add {f.name} to dataset", 'cyan')
            data.append(f.read())

    text_splitter = CharacterTextSplitter(chunk_size=2000, separator="\n")

    docs = []
    for sets in data:
        docs.extend(text_splitter.split_text(sets))

    store = FAISS.from_texts(docs, OpenAIEmbeddings())
    faiss.write_index(store.index, "training.index")
    store.index = None

    with open("faiss.pkl", "wb") as f:
        pickle.dump(store, f)

def run_prompt():
    index = faiss.read_index(str(curr_dir) + "/training.index")
    with open(str(curr_dir) + "/faiss.pkl", "rb") as f:
        store = pickle.load(f)
    store.index = index
    with open(str(curr_dir) + "/training/master.txt", "r") as f:
        prompt_template = f.read()

    prompt = Prompt(template=prompt_template, input_variables=["history", "context", "question"])

    # high temperature means its more likely to make things up. low temperature means its more likely to repeat things and only strictly uses data its trained on. play with this to find the best results
    llm_Chain = LLMChain(prompt=prompt, llm=OpenAI(temperature=0.7, top_p=0.9, frequency_penalty=0.0, presence_penalty=0.0, stop=["\n\n"]))

    def on_message(question, history):
        docs = store.similarity_search(question)
        contexts = []
        for i, doc in enumerate(docs):
            contexts.append(f"Context {i}:\n{doc.page_content}")
            answer = llm_Chain.predict(question=question, history=history, context="\n\n".join(contexts))
        return answer
    
    history = []
    while True:
        question = input(">>> ")
        answer = on_message(question=question, history=history)
        history.append(f"Human: {question}")
        history.append(f"Bot: {answer}")
        cprint(f"Bot: {answer}", 'cyan')

# train()
run_prompt()