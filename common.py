#!/usr/bin/env python
# Four spaces as indentation [no tabs]

import os, inspect
import re
import pprint

PATH = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe())))
DEFAULT_PROBLEM = 1

# ------------------------------------------
# Tokens
# ------------------------------------------

# Based on Norvig's Lis.py, http://norvig.com/lis.py
def parse(program):
    # Remove single line comments and tokenize
    program = re.sub(r";.*\n", '', program)
    return parse_tokens(program.replace('(', ' ( ').replace(')', ' ) ').split())

def parse_tokens(tokens):
    if len(tokens) == 0:
        raise SyntaxError('unexpected EOF while reading')
    token = tokens.pop(0)
    if '(' == token:
        group = []
        while tokens[0] != ')':
            group.append(parse_tokens(tokens))
        tokens.pop(0)
        return group
    elif ')' == token:
        raise SyntaxError('unexpected )')
    else:
        return token
