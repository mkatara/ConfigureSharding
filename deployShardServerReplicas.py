import pymongo
from pymongo import MongoClient


c1 = MongoClient('localhost', 27000)
config1 = {'_id': 'S1a', 'members': [
         {'_id': 0, 'host': 'localhost:27000'}]}
c1.admin.command("replSetInitiate", config1)

c2 = MongoClient('localhost', 27001)
config2 = {'_id': 'S2a', 'members': [
         {'_id': 1, 'host': 'localhost:27001'}]}
c2.admin.command("replSetInitiate", config2)

c3 = MongoClient('localhost', 27002)
config3 = {'_id': 'S3a', 'members': [
         {'_id': 1, 'host': 'localhost:27002'}]}
c3.admin.command("replSetInitiate", config3)

