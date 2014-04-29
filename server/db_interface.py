from pymongo import MongoClient
client = MongoClient('mongodb://study:jam@ds031328.mongolab.com:31328/study-jam')
db = client['study-jam']
users = db.users
friends = db.friends
locations = db.locations

"""Abstracts interaction with the database into a simple set of get and update
functions."""

def get_friends(user_id):
    """Returns a dictionary containing a list of a user's friends' user ids."""
    return friends.find_one({"_id": user_id})


def get_info(user_id):
    """Returns a dictionary containing a user's profile information."""
    return users.find_one({"_id": user_id})


def get_location(user_id):
    """Returns a dictionary containing a user's latitude, longitude, and study
    level."""
    return locations.find_one({"_id": user_id})


def update_location(user_id, latitude, longitude):
    locations.update({"_id": user_id, "latitude": latitude, "longitude": longitude})
