from spacy.util import get_data_path

data_path = get_data_path()
print([p for p in data_path.iterdir()])
print([p for p in data_path.iterdir() if p.is_dir()])
print([p.parts[-1] for p in data_path.iterdir()])
print([p.parts[-1] for p in data_path.iterdir() if p.is_dir()])
