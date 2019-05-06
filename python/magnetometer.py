import random


f = open("/tmp/magnetometer.csv","w")
for i in range(100):
    scale = 4
    x = (random.random() - 0.5) * scale + 0
    y = (random.random() - 0.5) * scale + 24
    z = (random.random() - 0.5) * scale + 16
    values = [x, y, z]

    f.write(",".join(map(str,values)))
    f.write("\n")
