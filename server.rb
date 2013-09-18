require 'socket'
require_relative 'session.rb'
require_relative 'searching.rb'

a = Session.new # Make a new session object
a.create # Create a server
puts "> Search server online"
print "> Loading words..."
dictionary = File.read('dictionary.txt').split("\n")
all_words   = dictionary.map { |x| x.split('!@#$')[0] }
types       = dictionary.map { |x| x.split('!@#$')[1] }
definitions = dictionary.map { |x| x.split('!@#$')[2] }
puts " Loaded"
begin
  loop { # Until exited...
    print "> Waiting for connection..."
    connection = a.accept # Accept the connection
    puts " Connected."
    print "  > Waiting for word..."
    message = connection.recv(1024) # Get what they sent
    if message.length.zero?  # User used ^C
      puts " User disconnected"
    else
      puts " #{message}"
      word = message # Turn the message into an int
      print "  > Searching for definitions of #{word}..."
      result = binary_search(all_words, word) # Search for the word in our words
      if result # If list is not empty
        result.map! { |place| "#{types[place].capitalize}: #{definitions[place].capitalize}" } # Join the type and definition, with formatting
        puts " Found #{result.length}."
        message = "  " + result.join("\n  ")
      else # If list is empty
        puts " 0 found."
        message = "No definition found" # Our message is "Not found"
      end
      if result # If we found results...
        type = "definitions" # We're sending definitions
      else # If we did not find a result...
        type = "error message" # We're sending an error message
      end
      print "  > Sending length of #{type} (#{message.length})..."
      connection.write(message.length) # Send the length of message to client can receive correct number of bytes
      puts " Sent."
      print "  > Sending definitions..."
      connection.write(message) # Send the message
      puts " Sent."
      print "  > Closing connection..."
      connection.close # Close the connection
      puts " Closed."
    end
  }
rescue Interrupt => e
  puts "\n> Server halted"
end
