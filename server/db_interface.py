import json

def get_friends(user_id):
    if user_id == 4045130232:
        return json.load(open('user.json'))
    return None


def get_info(user_id):
    if user_id == 4045130232:
        return json.load(open('user.json'))
    return None


def get_location(user_id):
    if user_id == 4045130232:
        return json.load(open('locations.json'))
    return None
