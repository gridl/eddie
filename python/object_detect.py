import sys


import cv2

filename = sys.argv[1]
vidcap = cv2.VideoCapture(filename)
success, image = vidcap.read()
count = 0

while success:
    # print(image)
    cv2.imwrite("images/frame{0:4d}.jpg".format(count), image)
    success,image = vidcap.read()
    print('Read a new frame: ', success)
    count += 1
    print(count)
