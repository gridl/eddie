flist = []
for i in range(3):
    flist.append(lambda: i)


print([f() for f in flist])
