from flask import Flask, jsonify

api = Flask(__name__)


@api.route('/')
def index():
    return jsonify({'message': 'Hello, World!'})


if __name__ == '__main__':
    api.run()
