#!/usr/bin/env python3

import os
import re

directory_path = "/Users/casvalkyriespicer/Desktop/TestForScripting" 
characters = r'[\/\\|:*?"<>]'

for root, dirs, files in os.walk(directory_path):
    for filename in files:
        file_path = os.path.join(root, filename)
        print(filename)
        match = re.search(characters, filename)
        if match:
            re.sub(characters, "", filename)
        print(file_path)