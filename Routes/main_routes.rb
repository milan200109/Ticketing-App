# routes/main_routes.rb

require 'sinatra'

get '/' do
  'Hello, welcome to ticketing app!'
end

# Endpoint to create a new ticket
post '/tickets' do
  # Parse JSON request body
  request_body = JSON.parse(request.body.read)

  # Create a new ticket
  new_ticket = {
    id: SecureRandom.uuid, # Generate a unique ID for the ticket
    title: request_body['title'],
    description: request_body['description'],
    status: 'open' # Initial status of the ticket
  }

  # Add the new ticket to the list
  tickets << new_ticket

  # Return the newly created ticket
  status 201
  content_type :json
  new_ticket.to_json
end

# Endpoint to retrieve all tickets
get '/tickets' do
  # Return all tickets
  content_type :json
  tickets.to_json
end

# Endpoint to retrieve a specific ticket by ID
get '/tickets/:id' do |id|
  # Find the ticket with the specified ID
  ticket = tickets.find { |t| t[:id] == id }

  # Return the ticket if found, or return a 404 error if not found
  if ticket
    content_type :json
    ticket.to_json
  else
    status 404
    'Ticket not found'
  end
end

# update a ticket by ID
put '/tickets/:id' do |id|
  # to Find the ticket with the ID
  ticket_index = tickets.find_index { |t| t[:id] == id }

  # Update the ticket if found
  if ticket_index
    
    request_body = JSON.parse(request.body.read)

    # Update ticket attributes
    tickets[ticket_index][:title] = request_body['title'] if request_body['title']
    tickets[ticket_index][:description] = request_body['description'] if request_body['description']
    tickets[ticket_index][:status] = request_body['status'] if request_body['status']

    # Return the updated ticket
    content_type :json
    tickets[ticket_index].to_json
  else
    status 404
    'Ticket not found'
  end
end

# to delete a ticket by ID
delete '/tickets/:id' do |id|
  # Find the ticket with the specified ID
  ticket = tickets.find { |t| t[:id] == id }

  # Delete the ticket if found
  if ticket
    tickets.delete(ticket)
    status 204
  else
    status 404
    'Ticket not found'
  end
end



