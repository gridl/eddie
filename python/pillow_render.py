import os

from PIL import Image, ImageFont, ImageDraw


im = Image.new("RGB", (160, 160))
draw = ImageDraw.Draw(im)

fonts_dir = os.path.expanduser('~/.fonts/')

# font_telugu = ImageFont.truetype(os.path.join(fonts_dir, "Pothana2001.ttf"), 50)
font_telugu = ImageFont.truetype(os.path.join(fonts_dir, "Vani.ttf"), 50)
text_telugu = "నిత్య"
draw.text((10, 10), text_telugu, font=font_telugu)

font_hindi = ImageFont.truetype(os.path.join(fonts_dir, "gargi.ttf"), 50)
text_hindi = "नित्य"
draw.text((10, 90), text_hindi, font=font_hindi)


im.show()
