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
    print "> Waiting for connection..."
    connection = a.accept # Accept the connection
    puts " Connected."
    message = connection.recv(1024) # Get what they sent
    if message.length.zero?  # User used ^C
      puts "> User disconnected"
    else
      puts "  > Received word: #{message}"
      word = message # Turn the message into an int
      print "  > Searching for definitions of #{word}..."
      result = binary_search(words, word) # Search for the int in our list, fibonacci
      result.map! { |place| "#{types[place].capitalize}: #{definitions[place].capitalize}" }
      if !result.empty? # If list is not empty
        puts " Found #{result.length}."
        message = "  " + result.join("\n  ")
      else # If list is empty
        puts "  > Did not find #{word} in list"
        message = "Not found" # Our message is "Not found"
      end
      print "  > Sending length of definitions (#{message.length})..."
      connection.write(message.length)
      puts " Sent."
      print "  > Sending definitions..."
      connection.write(message) # Send the message
      puts " Sent."
      connection.close # Close the connection
      puts "  > Connection closed"
    end
  }
rescue Interrupt => e
  puts "\n> Server halted"
end
