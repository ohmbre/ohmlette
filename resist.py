#!/usr/bin/python3

VOUT = -17.5
VOUT_EQN = lambda r1,r2: -1.22*(1+r2/r1)+30e-9*r2 #1.21*(1+r2/r1)+3e-6*r2
R1RANGE = (0,50000)
R2RANGE = (0,9999999)
IRANGE = (1e-12,10e-3)
VALUES = 'erjpb6b.txt'

f = open(VALUES,'r')
vals = f.read().split('\n')
r1s = []
r2s = []
for val in vals:
    if not val: continue
    if " " in val:
        val = val.split(' ')[0][:-3]
        if val[-1] == 'K':
            val = float(val[:-1])*1000
        elif val[-1] == 'M':
            val = float(val[:-1])*1000000
        else:
            val = float(val)
    else:
        val = float(val)
    if val >= R1RANGE[0] and val <= R1RANGE[1]:
        r1s.append(val)
    if val >= R2RANGE[0] and val <= R2RANGE[1]:
        r2s.append(val)
fin = []
for r1 in r1s:
    res = []
    for r2 in r2s:
        i = abs(VOUT)/(r1+r2)
        if i < IRANGE[0] or i > IRANGE[1]: continue
        vo = VOUT_EQN(r1,r2)
        err = abs(VOUT-vo)
        res.append((err,vo,r1,r2,i))
    res.sort()
    if res: fin.append(res[0])

fin.sort()

for err,vo,r1,r2,i in fin[:20]:

    print('r1:',r1)
    print('r2:',r2)
    print('vo:',vo)
    print('il',i)
    print('err:',err)
    print('')
