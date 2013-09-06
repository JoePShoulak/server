require 'socket'
require_relative 'session.rb'

a = Session.new
a.create
puts "> Reversal server online."
begin
  loop {
    puts "> Waiting for connection..."
    connection = a.accept
    puts "> Connection made"
    message = connection.recv(1024)
    if message.length.zero?
      puts "> User disconnected"
    else
      puts "  > Received: #{message}"
      puts "  > Sending:  #{message.reverse}"
      connection.write(message.reverse)
      connection.close
      puts "  > Connection closed"
    end
  }
rescue Interrupt => e
  puts "\n> Server halted"
end
