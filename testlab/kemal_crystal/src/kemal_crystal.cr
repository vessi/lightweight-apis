require "./kemal_crystal/*"
require "mongo"
require "kemal"
require "json"

module KemalCrystal
  client = Mongo::Client.new("mongodb://mongo:27017")
  db = client["testlab"]

  get "/api/status" do |env|
    env.response.content_type = "application/json"
    {status: "ok", databases: client.database_names}.to_json
  end

  get "/api/contacts" do |env|
    env.response.content_type = "application/json"
    record = db["contacts"].insert({"first_name": "Mikhail", "last_name": "Bortnyk", "github": "@vessi"})
    {status: "inserted", errors: record}.to_json
  end

  get "/api/count" do |env|
    env.response.content_type = "application/json"
    {collection: "contacts", count: db["contacts"].count}.to_json
  end
end
