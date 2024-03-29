#!/usr/bin/env python3

import json
import numpy as np

NAME='dot_80_40'
with open('weights.80x40.json') as f:
    weights= json.load(f)
with open('inputs.80x40.json') as f:
    inputs= json.load(f)

print ('='*80 + '\n Used in ' + NAME + '.sv \n' + '='*80)

weights = np.array(weights, dtype=np.float32)
print ('localparam ROWS = %d;' %weights.shape[0])
print ('localparam COLS = %d;\n' %weights.shape[1])
print ('localparam logic [31:0] weights [0:ROWS-1] [0:COLS-1] = \'{')
offset = 4
for i in range(weights.shape[0]):
    flts_hex = list(map( lambda x: '$shortrealtobits(' + str(x) + ')', weights[i]))
    print ('  \'{ ' )
    for j in range(0, len(flts_hex), offset):
        print ('    ' + ','.join(flts_hex[j:j+offset]), end='')
        print (',' if j < len(flts_hex) - offset else '')
    print ('  },' if i < weights.shape[0]-1 else '\t}')
print ('};')


print ('='*80 + '\n Used in ' + NAME  + '_tb.sv \n' + '='*80)
offset=3

flts = inputs
flts_bits = list(map( str, flts)) #lambda x: '$shortrealtobits(' + str(x) + ')', flts))
print ('static real vals [0:' + str(len(flts)-1) + '] = {')
for i in range(0, len(flts), offset):
    print (' ' + ', '.join(flts_bits[i:i+offset] ), end='')
    print (',' if i < len(flts) - offset else ' ')
print ('};') 
print ('static int MAX_SIZE = %d;' % len(flts))  


flts = np.dot(inputs, weights)
flts_bits = list(map( str, flts)) #lambda x: '$shortrealtobits(' + str(x) + ')', flts))
print ('static real vals [0:' + str(len(flts)-1) + '] = {')
for i in range(0, len(flts), offset):
    print (' ' + ', '.join(flts_bits[i:i+offset] ), end='')
    print (',' if i < len(flts) - offset else ' ')
print ('};') 
print ('static int MAX_SIZE = %d;' % len(flts)) 
#
