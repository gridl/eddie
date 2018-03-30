import xml.etree.ElementTree as ET


filename = '/tmp/f.xml'

et = ET.parse(filename)
data = [i for i in et.iter()]
print(data)
