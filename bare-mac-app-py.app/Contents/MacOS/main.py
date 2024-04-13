#!/usr/local/bin/python3

# 2024 Acceptable Tech

import os, sys, subprocess

class PATH: pass
PATH.SCRIPT = os.path.abspath(sys.argv[0])
PATH.SCRIPT_DIR = os.path.dirname(PATH.SCRIPT)
PATH.PARENT = os.path.abspath(os.path.join(PATH.SCRIPT_DIR, "../../.."))
PATH.RESOURCES = os.path.abspath(os.path.join(PATH.SCRIPT_DIR, "../Resources"))

def exec( bin_path, args ):
	try:
		cmd = [bin_path] + args
		result = subprocess.run(cmd, check=True)
	except subprocess.CalledProcessError as e:
		print( f"{bin_path} failed with exit code {e.returncode}." )
	except Exception as e:
		print( f"Failed to run {bin_path}: {e}" )

def main():
	
	msg = "I think I was launched from " + PATH.PARENT + " and my resources are at " + PATH.RESOURCES
	print(msg)

	spoken_msg = msg.replace('/',' slash ')
	exec( "/usr/bin/say", [spoken_msg] )

if __name__ == "__main__":
	main()
