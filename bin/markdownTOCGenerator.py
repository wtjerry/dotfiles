#!/usr/bin/env python3

import sys


def main():
    filepath = sys.argv[1]
    
    l1 = 1
    l2 = 1
    l3 = 1
    l4 = 1
    l5 = 1
    with open(filepath, 'r') as f:
        lines = f.readlines()
        for l in lines:
            l = l[:-1]
            if l.startswith('#####'):
                heading = extract_heading(l[6:])
                ref = extract_ref(l[6:])
                print('\t\t\t\t{0}. [{1}](#{2})'.format(l5, heading, ref))
                l5+=1
            elif l.startswith('####'):
                heading = extract_heading(l[5:])
                ref = extract_ref(l[5:])
                print('\t\t\t{0}. [{1}](#{2})'.format(l4, heading, ref))
                l4+=1
                l5=1
            elif l.startswith('###'):
                heading = extract_heading(l[4:])
                ref = extract_ref(l[4:])
                print('\t\t{0}. [{1}](#{2})'.format(l3, heading, ref))
                l3+=1
                l4=1
                l5=1
            elif l.startswith('##'):
                heading = extract_heading(l[3:])
                ref = extract_ref(l[3:])
                print('\t{0}. [{1}](#{2})'.format(l2, heading, ref))
                l2+=1
                l3=1
                l4=1
                l5=1
            elif l.startswith('#'):
                heading = extract_heading(l[2:])
                ref = extract_ref(l[2:])
                print('{0}. [{1}](#{2})'.format(l1, heading, ref))
                l1+=1
                l2=1
                l3=1
                l4=1
                l5=1


def extract_heading(s):
    if '<a name=' in s:
        return s.split(' <a name=')[0]
    return s


def extract_ref(s):
    if '<a name=' in s:
        return s.split(' <a name=\"')[1][:-3]
    return s


if __name__ == '__main__':
    main()
