'''
This script creates the ids necessary for evaluation
'''

import json

with open('itl_queries/test_instruction/G3_instruction.json', 'r') as fp:
    data = json.load(fp)

ids = {}

for task in data:
    ids[task['query_id']] = 0

with open('itl_queries/test_query_ids/G3_instruction.json', 'w') as fp:
    json.dump(ids, fp, indent=4)