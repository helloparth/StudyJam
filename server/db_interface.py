import json

def get_friends(user_id):
    if user_id == 4045130232:
        return { 'friends': [4046427433, 1233549394] }
    return None


def get_info(user_id):
    if user_id == 4045130232:
        return { 'user': {
                    'first_name': 'Parth',
                    'last_name': 'Patel'
                 }
        }
    return None


def get_location(user_id):
    if user_id == 4045130232:
        return { 'locations': {
                    'latitude': 34.1000167,
                    'longitude': -117.7131484,
                    'study_level': 5
                 }
        }
    return None
