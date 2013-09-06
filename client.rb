require 'socket'
require_relative 'session.rb' 

s = Session.new
begin
  s.connect
rescue
  puts "> Server unresponsive"
  exit
end
if s.socket != nil
  begin
    puts "> Connection made to server"
    message = ""
    while message.length.zero?
      puts "> What number would you like to search for?"
      print "> "
      message = gets.chomp
      if message.length.zero?
        puts "> Nothing entered"
      end
    end
    s.send(message) 
    puts "> Message sent"
    puts "> Received: #{s.get}"
    s.close
    puts "> Disconnected from server"
  rescue Interrupt
    puts "\n> User canceled"
    s.close
    puts "> Disconnected from server"
  end
else
  puts "> Server connection error"
end
