#!/usr/bin/env python
# Four spaces as indentation [no tabs]

if __name__ == '__main__':
    import os
    zipname = raw_input('Student ID (e.g. 09123456): ')
    os.system("zip -r s" + zipname + ".zip pddl")