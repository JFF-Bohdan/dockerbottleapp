import argparse
import uuid

parser = argparse.ArgumentParser()
parser.add_argument("-s", "--short", help="generate uid in short form", default=False, action="store_true")
args = parser.parse_args()

s = str(uuid.uuid4())
if args.short:
    s = s.replace("-", "")

print(s)
