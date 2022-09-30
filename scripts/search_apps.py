#!/bin/env/python3

import sys 

# Find the CMakeLists.txt file from the InfiniTime repo in argv[1]
it_dir = sys.argv[1]
cmakelists_dir = it_dir + "/src/CMakeLists.txt"

cmakelists_file = open(cmakelists_dir, "rt")

f = cmakelists_file.read()
lines = f.split('\n')

for l in lines:
	if("displayapp/screens" in l):
		#print("Found at line {}: {}".format(lines.index(l) + 1, l))
		print(f"{l}")

cmakelists_file.close()

