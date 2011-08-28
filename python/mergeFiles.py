#!/usr/bin/env python

import sys

def main(argv):

    gene_file = open("tmp/genes", 'r')
    nogene_file = open("tmp/nogene", 'r')
    final_out = open("tmp/out", 'w')

    for line in gene_file:
        final_out.write(line)
    for line in nogene_file:
        final_out.write(line)

    gene_file.close()
    nogene_file.close()
    final_out.close()

if __name__ == "__main__":
    main(sys.argv)
