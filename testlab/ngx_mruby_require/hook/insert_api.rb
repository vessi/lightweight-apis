collection = Userdata.new("mongo").collection

record = collection.insert(first_name: 'Mikhail', last_name: 'Bortnyk', github: '@vessi')

Nginx.echo JSON::stringify(record)
