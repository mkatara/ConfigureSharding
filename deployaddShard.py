import pymongo
from pymongo import MongoClient

conn = MongoClient('localhost', 27017)
admin = conn.admin
admin.command('addshard', 'S1a/localhost:27000', allowLocal=True)
admin.command('addshard', 'S2a/localhost:27001', allowLocal=True)
admin.command('addshard', 'S3a/localhost:27002', allowLocal=True)