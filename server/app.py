"""StudyJam backend server. Provides an API for clients to send and receive
data from."""

from flask import Flask, request
import json

import db_interface

app = Flask(__name__)

@app.route('/api/user/<int:user_id>', methods=['GET', 'POST'])
def get_info(user_id):
    """Returns JSON containing a user's profile information."""
    return json.dumps(db_interface.get_info(user_id))


@app.route('/api/user/<int:user_id>/friends')
def get_friends(user_id):
    """Returns JSON containing the user ids of a user's friends."""
    return json.dumps(db_interface.get_friends(user_id))


@app.route('/api/user/<int:user_id>/location')
def get_location(user_id):
    if request.method == "POST":
        db_interface.update_location(user_id, latitude, longitude)
    """Returns JSON with a user's latitude, longitude, and study level."""
    return json.dumps(db_interface.get_location(user_id))

if __name__ == '__main__':
    app.run(debug=True)
