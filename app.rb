# app.rb

require 'sinatra'
require_relative 'routes/main_routes'
require_relative 'routes/webhook_routes'


get '/' do
  'Hello, Welcome to Ticketing App!'
end