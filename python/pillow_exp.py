from PIL import Image
import numpy as np

Image.fromarray(np.empty((0, 0), dtype=np.uint8))

# img = Image.open('foo.jpg')
# new_width, new_height = 0, 0
# img = img.resize((1, 1), Image.ANTIALIAS)
# img.save('bar.jpg')
