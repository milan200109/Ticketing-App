# models/ticket.rb
class Ticket
    attr_accessor :id, :subject, :description
  
    def initialize(id, subject, description)
      @id = id
      @subject = subject
      @description = description
    end
  end
  