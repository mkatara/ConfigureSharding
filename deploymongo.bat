rmdir %mongopath%\Cfg1 /s/q
rmdir %mongopath%\Cfg2 /s/q 
rmdir %mongopath%\Cfg3 /s/q
rmdir %mongopath%\S1a /s/q
rmdir %mongopath%\S2a /s/q
rmdir %mongopath%\S3a /s/q 
mkdir %mongopath%\Cfg1
mkdir %mongopath%\Cfg2
mkdir %mongopath%\Cfg3
mkdir %mongopath%\S1a
mkdir %mongopath%\S2a
mkdir %mongopath%\S3a
start cmd.exe @ cmd /k  mongod --configsvr --replSet C1a --dbpath %mongopath%\Cfg1 --port 26050  --logpath %mongopath%\log.cfg1 --logappend
start cmd.exe @ cmd /k  mongod --configsvr --replSet C1a --dbpath %mongopath%\Cfg2 --port 26051  --logpath %mongopath%\log.cfg2 --logappend
start cmd.exe @ cmd /k  mongod --configsvr --replSet C1a --dbpath %mongopath%\Cfg3 --port 26052 --logpath %mongopath%\log.cfg3  --logappend
ping 127.0.0.1 -n 5 > nul 
python C:\python-programs\deployConfigServerReplicas.py
ping 127.0.0.1 -n 5 > nul
start cmd.exe @ cmd /k  mongod --shardsvr --replSet S1a --dbpath %mongopath%\S1a --logpath %mongopath%\log.S1a --bind_ip localhost --port 27000 --logappend 
start cmd.exe @ cmd /k  mongod --shardsvr --replSet S2a --dbpath %mongopath%\S2a --logpath %mongopath%\log.S2a --bind_ip localhost --port 27001 --logappend 
start cmd.exe @ cmd /k  mongod --shardsvr --replSet S3a --dbpath %mongopath%\S3a --logpath %mongopath%\log.S3a --bind_ip localhost --port 27002 --logappend 
ping 127.0.0.1 -n 5 > nul
python C:\python-programs\deployShardServerReplicas.py
ping 127.0.0.1 -n 5 > nul
start cmd.exe @ cmd /k  mongos --configdb C1a/localhost:26050,localhost:26051,localhost:26052 --bind_ip localhost --port 27017 --logappend --logpath %mongopath%\log.mongoS1 
start cmd.exe @ cmd /k  mongos --configdb C1a/localhost:26050,localhost:26051,localhost:26052 --bind_ip localhost --port 26062 --logappend --logpath %mongopath%\log.mongoS2 
start cmd.exe @ cmd /k  mongos --configdb C1a/localhost:26050,localhost:26051,localhost:26052 --bind_ip localhost --port 26063 --logappend --logpath %mongopath%\log.mongoS3
ping 127.0.0.1 -n 5 > nul
python C:\python-programs\deployaddShard.py