require 'socket'
a = TCPServer.new('', 3333) # '' means to bind to "all interfaces", same as nil or '0.0.0.0'
puts "> Reversal server online."
begin
  loop {
    puts "> Waiting for connection..."
    connection = a.accept
    puts "> Connection made"
    message = connection.recv(1024)
    puts "  > received: #{message}"
    puts "  > sending:  #{message.reverse}"
    connection.write(message.reverse)
    connection.close
    puts "  > connection closed"
  }
rescue Interrupt => e
  puts "\n> Server halted"
end
