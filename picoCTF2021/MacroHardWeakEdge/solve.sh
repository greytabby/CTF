#!/bin/bash

cat ./_fun.pptm.extracted/ppt/slideMasters/hidden | tr -d ' ' | base64 -d

