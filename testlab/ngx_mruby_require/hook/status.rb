require './hello'

collection = Userdata.new("mongo").collection

dbs = collection.database.client.databases

Hello.new.hello
Nginx.echo JSON::stringify({status: "ok", databases: dbs})
