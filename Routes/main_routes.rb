# routes/main_routes.rb

require 'sinatra'

get '/' do
  'Hello, this is your ticketing app!'
end

post '/submit_ticket' do
  ticket = params[:ticket]
  "Received ticket: #{ticket}"
end

