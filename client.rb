require 'socket'
require_relative 'session.rb' 

s = Session.new # Make a new session object
begin
  s.connect # Connect to the server
rescue # If something goes wrong (usually the server isn't running)
  puts "> Server unresponsive" # Report error
  exit # Shut down
end
if s.socket != nil # If we don't have a nil connection (i.e. we're connected)
  begin
    puts "> Connection made to server"
    message = ""
    while message.length.zero? # While there is no value for the message
      puts "> What word would you like to look up?"
      print "> "
      message = gets.chomp # Ask for a message
      if message.length.zero? # If they entered nothing, tell them that and continue the loop
        puts "> Nothing entered"
      end
    end
    print "> Sending message..."
    s.send(message) # Send the message
    puts " Sent."
    length = s.get.to_i # Get the length of the string we're receiving
    puts "#{s.get(length)}" # Get the string
    s.close # Close the server
    puts "> Disconnected from server"
  rescue Interrupt # If user does ^C
    puts "\n> User canceled"
    s.close # Close the socket
    puts "> Disconnected from server"
  end
else # If we have a nil connection
  puts "> Server connection error" # Report error
end