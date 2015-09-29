require 'json'
require 'rack/router'
require 'mongo'

client = Mongo::Client.new('mongodb://mongo:27017/testlab')

status = ->(env) do
  [
    200,
    {"Content-Type" => "application/json"},
    [JSON.generate({status: "ok", databases: client.database_names})]
  ]
end

insert_api = ->(env) do
  record_id = client[:contacts].insert_one({first_name: 'Mikhail', last_name: 'Bortnyk', github: '@vessi'}).inserted_id
  [
    201,
    {"Content-Type" => "application/json"},
    [JSON.generate({first_name: 'Mikhail', last_name: 'Bortnyk', github: '@vessi', _id: record_id.to_s})]
  ]
end

app = Rack::Router.new do
  get "/api/status" => status
  get "/api/contacts" => insert_api
end

run app
