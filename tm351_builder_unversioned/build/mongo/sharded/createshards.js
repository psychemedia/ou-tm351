db.adminCommand( { addshard : "s0/"+"localhost:37017" } );
db.adminCommand( { addshard : "s1/"+"localhost:47017" } );
db.adminCommand( { addshard : "s2/"+"localhost:57017" } );
use accidents
db.dropDatabase()
db.adminCommand({enableSharding: "accidents"})
db.adminCommand({shardCollection: "accidents.accidents", key:{Accident_Index: 1}})
db.adminCommand({shardCollection: "accidents.roads", key:{CP: 1}})
