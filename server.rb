require 'socket'
require_relative 'session.rb'
require_relative 'searching.rb'

a = Session.new # Make a new session object
a.create # Create a server
puts "> Search server online"
print "> Loading words..."
dictionary = File.read('dictionary.txt').split("\n")
words       = dictionary.map { |x| x.split('!@#$')[0] }
types       = dictionary.map { |x| x.split('!@#$')[1] }
definitions = dictionary.map { |x| x.split('!@#$')[2] }
puts " Loaded"
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
      word = message # Turn the message into an int
      result = binary_search(words, word) # Search for the int in our list, fibonacci
      if result # If we sound something...
        puts "  > Found #{word} at position #{result}"
        message = "#{types[result].capitalize}: #{definitions[result].capitalize}"
      else # If we didn't...
        puts "  > Did not find #{word} in list"
        message = "Not found" # Our message is "Not found"
      end
      puts "  > Sending: \"#{message}\""
      connection.write(message) # Send the message TODO: Handle receiving list for multiple entries
      connection.close # Close the connection
      puts "  > Connection closed"
    end
  }
rescue Interrupt => e
  puts "\n> Server halted"
end
