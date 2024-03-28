# routes/webhook_routes.rb

require 'sinatra'
require 'json'

post '/webhook' do
  request.body.rewind
  payload_body = request.body.read
  payload = JSON.parse(payload_body)

  # Process the webhook payload
  # You can add your logic here to handle the incoming webhook data

  "Webhook received successfully!"
end 
