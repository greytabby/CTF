#!/bin/bash
exiftool cat.jpg | grep License | awk -F ':' '{print $2}' | tr -d ' ' | base64 -d 
