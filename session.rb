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
