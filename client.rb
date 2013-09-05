require 'socket'

a = TCPSocket.new('127.0.0.1', 3333)
puts "> Connection made to server"
puts "> What would you like to say?"
print "> "
a.write gets.chomp
puts "> Message sent"
puts "> Received: #{a.recv(1024)}"
a.close
puts "> Disconnected from server"
