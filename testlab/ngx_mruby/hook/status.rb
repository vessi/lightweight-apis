collection = Userdata.new("mongo").collection

dbs = collection.database.client.databases

Nginx.echo JSON::stringify({status: "ok", databases: dbs})
