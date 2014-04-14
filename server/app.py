from flask import Flask
import json

import db_interface

app = Flask(__name__)

@app.route('/api/user/<int:user_id>')
def get_info(user_id):
    return json.dumps(db_interface.get_info(user_id))


@app.route('/api/user/<int:user_id>/friends')
def get_friends(user_id):
    return json.dumps(db_interface.get_friends(user_id))


@app.route('/api/user/<int:user_id>/location')
def get_location(user_id):
    return json.dumps(db_interface.get_user_location(user_id))

if __name__ == '__main__':
    app.run(debug=True)
