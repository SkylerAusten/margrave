from flask import Flask, request, jsonify
import requests
import os

app = Flask(__name__)

# Get the Racket service URL from an environment variable for flexibility,
# with a default for local docker-compose runs.
RACKET_API_URL = os.getenv("RACKET_URL", "http://racket-app:8000/compute")

@app.route('/')
def index():
    return '<h1>Flask front-end is running.</h1><p>Send a POST request to /calculate with two numbers to add.</p>'

@app.route('/calculate', methods=['POST'])
def calculate():
    try:
        # Get data from the user's request
        incoming_data = request.get_json()
        if not incoming_data or 'num1' not in incoming_data or 'num2' not in incoming_data:
            return jsonify({"error": "Please provide 'num1' and 'num2' in the JSON body"}), 400

        # Send the numbers to the Racket backend
        response = requests.post(RACKET_API_URL, json=incoming_data)
        response.raise_for_status()  # Raises an exception for bad status codes (4xx or 5xx)

        # Return the result from Racket back to the user
        return response.json()

    except requests.exceptions.RequestException as e:
        # Handle network errors or bad responses from the Racket service
        return jsonify({"error": f"Could not connect to Racket service: {e}"}), 503