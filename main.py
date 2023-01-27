import psutil
from flask import Flask, jsonify

api = Flask(__name__)


@api.route('/')
def index():
    return jsonify({
        'message': 'Hello, World!',
    })


@api.route('/stats')
def stats():
    return jsonify({
        'cpu_count': psutil.cpu_count(),
        'cpu_load_percent': psutil.cpu_percent(),
        'ram_load_percent': psutil.virtual_memory().percent,
    })


if __name__ == '__main__':
    print("Starting app...")
    api.run()
    print("Stopping app...")

print("Exiting...")