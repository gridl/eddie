import os

import cognitive_face as cf


key = os.environ.get('MICROSOFT_KEY')
base_url = 'https://southeastasia.api.cognitive.microsoft.com/face/v1.0/'

print(key)
cf.Key.set(key)
cf.BaseUrl.set(base_url)

group_id = 'demo'
person_group_id = 'demo'
try:
    cf.person_group.create(group_id)
except:
    pass

name = 'modi'

try:
    person = cf.person.create(group_id, name)
except:
    pass

file_path = '/home/chillaranand/Downloads/m4.jpg'
cf.person.add_face(file_path, group_id, person['personId'])

cf.person_group.train(person_group_id)


# detect person
faces = cf.face.detect(file_path)
face_ids = [i['faceId'] for i in faces]

r = cf.face.identify(face_ids, person_group_id)
print(r)
