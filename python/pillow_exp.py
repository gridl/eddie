from PIL import Image
import numpy as np

Image.fromarray(np.empty((0, 0), dtype=np.uint8))

# img = Image.open('foo.jpg')
# new_width, new_height = 0, 0
# img = img.resize((1, 1), Image.ANTIALIAS)
# img.save('bar.jpg')


# convert image to np array
in_data = np.asarray(im, dtype=np.uint8)


from PIL import Image
from pylab import *
from scipy.ndimage import filters,measurements,interpolation


img = Image.open('f.png')
print(img.size)
#img.show()
wd, ht = img.size
pix = np.array(img.convert('1').getdata(), np.uint8)
bimg = 1 - (pix.reshape((ht, wd)) / 255.)

plt.imshow(bimg)
plt.show()

#image.show()
#image = np.asarray(image, dtype=np.uint8)

print(bimg.shape)
dimg = rdistort(bimg, cval=100)


plt.imshow(bimg)
plt.show()
