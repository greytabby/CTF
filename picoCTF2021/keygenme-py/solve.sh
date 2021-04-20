#!/bin/bash
# sha256(username_trial):496e54f222f256b023f33cdda0270853f39d7bf24fa1ca6b72d4b4fd1a9cae56
#                        0123456789
key="picoCTF{1n_7h3_|<3y_of_54ef6292}"
{ echo -e "c\n${key}"; cat; } | python3 keygenme-trial.py
