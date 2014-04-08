from flask import Flask
import json
from pprint import pprint	
import unicodedata as uc
import cgi
import cgitb
import os
cgitb.enable()

user = {}
location = {}
friends = {} 

app = Flask(__name__)

@app.route("/")
def hello():
	#number = raw_input("What is the user's phone number?")
	#number = "4045130232"
	#print number
	json_data = open('user.json')
	user_init = json.load(json_data)
	json_data.close()

	json_data = open('locations.json')
	locations_init = json.load(json_data)
	json_data.close()

	json_data = open('friends.json')
	friends_init = json.load(json_data)
	json_data.close()



	pprint(user_init)
	#print number

	#coordinates =  data["numbers"][0][number]

	#add_user('andy', 'molina', 12344567890, 100.0, 200.0)
	first =  get_last_name(12344567890)
	last =  get_last_name(12344567890)
	llong = get_long(12344567890)
	llat = get_lat(12344567890)
	sl = get_study_level(12344567890)
	print first, last, llong, llat, sl
	return 	get_last_name(12344567890)

	
	

def add_user(first_name, last_name, number, longitude, latitude, study_level = 1):
	
	#new user.json file
	newID = {}
	newID[unicode("_id")] = 4045130232

	new_first_name = {}
	new_first_name[unicode("first_name")] = unicode(first_name)

	new_last_name = {}
	new_last_name[unicode("last_name")] = unicode(last_name)
	
	user_vals = [newID, new_first_name, new_last_name]
	new_user = {}
	new_user [unicode("user")] = user_vals

	with open('user_' + str(number) + '.json', 'w') as outfile:
  		json.dump(new_user, outfile)
		
	#new locations.json file
  	new_long = {}
	new_long[unicode("longitude")] = unicode(longitude)

	new_lat = {}
	new_lat[unicode("latitude")] = unicode(latitude)
	
	new_studyLevel = {}
	new_studyLevel[unicode("study_level")] = unicode(study_level)

	loc_vals = [newID, new_long, new_lat, new_studyLevel]
	new_loc = {}
	new_loc [unicode("user")] = loc_vals

	with open('locations_' + str(number) + '.json', 'w') as outfile:
	  		json.dump(new_loc, outfile)

	friends = {}
	friends[unicode("friends")] = []
	new_friends = {}
	new_friends[unicode("friends")] = friends

	with open('friends_' + str(number) + '.json', 'w') as outfile:
	  		json.dump(new_friends, outfile)

def remove_user (number):
	user_file = 'user_' + str(number) + '.json'
	locations_file = 'locations_' + str(number) + '.json'
	friends_file = 'friends_' + str(number) + '.json'

	#delete 3 files corresponding to user
	os.remove(user_file)
	os.remove(locations_file)
	os.remove(friends_file)

	##update friends lists in users

def update_user(name, number, coordinates):
	user_file = open('user_' + str(number) + '.json', 'r+')
	locations_file = open('locations_' + str(number) + '.json', 'r+')
	friends_file = open('friends_' + str(number) + '.json', 'r+')

	#use mongoDB commands here to actually load in .json files and make updates

def get_first_name(number):
	json_data = open('user_' + str(number) + '.json')
	user = json.load(json_data)
	json_data.close()
	return user[unicode('user')][1][unicode('first_name')]

def get_last_name(number):
	json_data = open('user_' + str(number) + '.json')
	user = json.load(json_data)
	json_data.close()
	return user[unicode('user')][2][unicode('last_name')]


def get_long(number):
	json_data = open('locations_' + str(number) + '.json')
	locations = json.load(json_data)
	json_data.close()
	return locations[unicode('user')][1][unicode('longitude')]


def get_lat(number):
	json_data = open('locations_' + str(number) + '.json')
	locations = json.load(json_data)
	json_data.close()
	return locations[unicode('user')][2][unicode('latitude')]

def get_study_level(number):
	json_data = open('locations_' + str(number) + '.json')
	locations = json.load(json_data)
	json_data.close()
	return locations[unicode('user')][3][unicode('study_level')]


def get_friends_list(number):
	json_data = open('friends_' + str(number) + '.json')
	friends = json.load(json_data)
	json_data.close()
	return friends[unicode('friends')][1][unicode('friends')]


if __name__ == "__main__":
	app.run(debug = True)