from PIL import Image, ImageFont, ImageDraw


im = Image.new("RGB",(160, 160))
draw = ImageDraw.Draw(im)


font_telugu = ImageFont.truetype("/home/chillar/.fonts/Pothana2001.ttf", 50)
text_telugu = "నిత్య"

font_hindi = ImageFont.truetype("/home/chillar/.fonts/gargi.ttf", 50)
text_hindi = "नित्य"


draw.text((10, 10), text_telugu, font=font_telugu)
draw.text((10, 90), text_hindi, font=font_hindi)

im.show()
