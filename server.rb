require 'socket'
require_relative 'session.rb'
require_relative 'searching.rb'

fibonacci = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765]

a = Session.new # Make a new session object
a.create # Create a server
puts "> Search server online"
begin
  loop { # Until exited...
    puts "> Waiting for connection..."
    connection = a.accept # Accept the connection
    puts "> Connection made"
    message = connection.recv(1024) # Get what they sent
    if message.length.zero?  # User used ^C
      puts "> User disconnected"
    else
      puts "  > Received: #{message}"
      number = message.to_i # Turn the message into an int
      result = binary_search(fibonacci, number) # Search for the int in our list, fibonacci
      if result # If we sound something...
        puts "  > Found #{number} at position #{result}"
        if result == 1 # If it was the first number...
          message = "1, 2" # The first two Fibonacci numbers are the same
        else
          message = result # The list is shifted by one due to the
        end
      else # If we didn't...
        puts "  > Did not find #{number} in list"
        message = "Not found" # Our message is "Not found"
      end
      puts "  > Sending: #{message}"
      connection.write(message) # Send the message
      connection.close # Close the connection
      puts "  > Connection closed"
    end
  }
rescue Interrupt => e
  puts "\n> Server halted"
end
