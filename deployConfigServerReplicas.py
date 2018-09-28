import pymongo
from pymongo import MongoClient

client = MongoClient('localhost', 26050)
c = MongoClient('localhost', 26050)
config = {'_id': 'C1a', 'members': [
         {'_id': 0, 'host': 'localhost:26050'},
         {'_id': 1, 'host': 'localhost:26051'},
         {'_id': 2, 'host': 'localhost:26052'}]}
c.admin.command("replSetInitiate", config)
