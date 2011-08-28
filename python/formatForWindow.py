#! /usr/bin/env python

import sys
from string import *

"""
Use to prep for windowFlanksRegion
Import BED4 with chr, start, stop, value
Export BED6 with chr, start, stop, 'name', 0 value, "+"
"""

def main(argv):

    infile = open(argv[1], 'r')
    outfile = open(argv[1] + "_form", 'w')
    for line in infile:
        sline = line.strip().split()
        out = "\t".join([sline[0], sline[1], sline[2], sline[3], str(0), "+"]) + "\n"
        outfile.write(out)
    outfile.close()
    
if __name__ == "__main__":
    main(sys.argv)
