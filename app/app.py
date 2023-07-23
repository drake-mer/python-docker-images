from flask import Flask
import celery  # this is just to check that everything work

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "Hello, World!"



