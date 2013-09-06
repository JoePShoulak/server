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
      puts "> What number would you like to search for?"
      print "> "
      message = gets.chomp # Ask for a message
      if message.length.zero? # If they entered nothing, tell them that and continue the loop
        puts "> Nothing entered"
      end
    end
    s.send(message) # Send the message
    puts "> Message sent"
    begin
      puts "> Received: #{s.get}" # Get the response
    rescue # If server does not respond (usually, the server stopped running)
      puts "> Server not responding" # Report error
      exit # Exit 
    end  
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
