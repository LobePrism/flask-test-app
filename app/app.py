from flask import Flask, render_template
from flask_socketio import SocketIO, emit

app = Flask(__name__)
socket = SocketIO(app)


@app.route('/')
def hello_world():
    return render_template('index.html')


@socket.event("message")
def on_message(message):
    print(message)
    emit('my response', {'data': message})


if __name__ == "__main__":
      socket.run(app)
