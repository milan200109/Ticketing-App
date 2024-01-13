# controllers/app.rb
require 'sinatra'
require_relative '../models/ticket'

tickets = []

get '/tickets' do
  tickets.to_json
end

post '/tickets' do
  data = JSON.parse(request.body.read)
  ticket = Ticket.new(tickets.length + 1, data['subject'], data['description'])
  tickets << ticket
  ticket.to_json
end
