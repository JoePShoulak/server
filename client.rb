require 'socket'

class Session
  attr_accessor :socket

  def connect
    self.socket = TCPSocket.new('127.0.0.1', 3333)
  end

  def send(message)
    self.socket.write(message)
  end

  def get
    self.socket.recv(1024)
  end

  def close
    self.socket.close
  end
end


s = Session.new
s.connect
if s.socket != nil
  begin
    puts "> Connection made to server"
    message = ""
    while message.length.zero?
      puts "> What would you like to say?"
      print "> "
      message = gets.chomp
      if message.length.zero?
        puts "> Nothing entered"
      end
    end
    s.send(message) 
    puts "> Sending..."
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
