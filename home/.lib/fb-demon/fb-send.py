#!/usr/bin/python3

import json
import subprocess
import os, sys, getopt

def fb_demon(cmd, *args):
	aa = json.dumps(args).replace('\\', '\\\\');
	return subprocess.check_output(["fb-demon", "pipe", cmd, aa]);

def getUserID(name):
	aa = fb_demon('getUserID', name);
	return json.loads(aa);

def chooseUser(name):
	users = getUserID(name)
	for (i, usr) in enumerate(users):
		# print(i, usr['name'])
		print(" %i: %s" % (i, usr['name']))
	
	index = int(input("# > "));
	if ( 0 <= index < len(users) ):
		return users[index]['userID']
	return None	
		

# send <message> <to>
def sendMessage(message, to):
	userID = ChooseUser(to)
	fb_demon("sendMessage", message, userID)

def helpmessage():
	print( "%s -m <message> -a <attachment> [thread]" % sys.argv[0]);
	sys.exit(2);


def main(argv):
	msg = {}	

	try:	
		opts, args = getopt.getopt(argv,"hm:a:", ["message", "attachment"]);
	except getopt.GetoptError:
		helpmessage()
	for opt, arg in opts:
		if opt == '-h': helpmessage();
		elif opt in ('-m', '-message'): msg['body'] = arg
		elif opt in ('-a', '-attachment'): msg['attachment'] = os.path.abspath(arg)
	if len(args) > 0:
		userID = chooseUser(args[0]);
	else: userID = "100002011303211" #  TODO
	
	fb_demon("sendMessage", msg, userID)

if __name__ == "__main__":
	main(sys.argv[1:]);
