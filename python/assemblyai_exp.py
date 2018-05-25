import json
import requests

import assemblyai


url = 'https://api.assemblyai.com/transcript'
token = None

headers = {'authorization': token}
audio_file = 'f.mp3'

audio_file = 'https://avilpage.com/media/audio/blob_ZzyEsGT'

data = json.dumps({'audio_src_url': audio_file})
r = requests.post(url, data=data, headers=headers)

aai = assemblyai.Client(token=token)
audio_file = 'audio/blob_05Qf5MO'
transcript = aai.transcribe(filename=audio_file)

while transcript.status != 'completed':
    transcript = transcript.get()

text = transcript.text
print(text)
