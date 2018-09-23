f = open('erjpb6b.txt','r')
vals = f.read().split('\n')
r1s = []
r2s = []
for val in vals:
    if not val: continue
    val = val.split(' ')[0][:-3]
    if val[-1] == 'K':
        val = float(val[:-1])*1000
    elif val[-1] == 'M':
        val = float(val[:-1])*1000000
    else:
        val = float(val)
    if True: #val < 4170:
        r1s.append(val)
    r2s.append(val)

print(r1s)
print(r2s)


fin = []
for r1 in r1s:
    res = []
    for r2 in r2s:
        il = 17.0/(r1+r2)
        if il < 0.000005: continue
        if il > 0.00005: continue
        vo = 1.175*(r1/r2+1)#1.21*(1+r2/r1)+.000003*r2
        err = abs(17-vo)
        res.append((err,vo,r1,r2,il))
    res.sort()
    fin.append(res[0])

fin.sort()

for err,vo,r1,r2,il in fin[:20]:

    print('r1:',r1)
    print('r2:',r2)
    print('vo:',vo)
    print('il',il)
    print('err:',err)
    print('')
