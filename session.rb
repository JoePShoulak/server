class Session
  attr_accessor :socket, :server

  def connect(addr = '127.0.0.1', port = 3333)
    self.socket = TCPSocket.new(addr, port)
  end

  def accept
    self.server.accept
  end

  def create(addr = '', port = 3333)
    self.server = TCPServer.new(addr, port)
  end

  def send(message)
    self.socket.write(message)
  end

  def get(bytes=1024)
    self.socket.recv(bytes)
  end

  def close
    self.socket.close
  end
end
