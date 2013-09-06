require 'socket'
require_relative 'session.rb'

fibonacci = [1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946]

def find_center(l)
  exp = 1
  while 2**exp < l.length
    exp += 1
  end
  2**(exp - 1)
end

def binary_search(list, item)
  it = find_center(list)
  place = it
  found = false
  while it != 0
    it /= 2
    if list[place] == item
      found = true
      it = 0
    elsif list[place] < item
      place += it
    elsif list[place] > item
      place -= it
    end
  end
  if found
    place
  else
    false
  end
end

a = Session.new
a.create
puts "> Reversal server online"
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
      number = message.to_i
      result = binary_search(fibonacci, number)
      if result
        puts "  > Found #{number} at position #{result}"
        message = result
      else
        puts "  > Did not find #{number} in list"
        message = "Not found"
      end
      puts "  > Sending: #{message}"
      connection.write(message)
      connection.close
      puts "  > Connection closed"
    end
  }
rescue Interrupt => e
  puts "\n> Server halted"
end
