# Dictionary Server #

## About ##
This is a program I'm writing for school that will be a server that can be accessed via the command line where the argument is a word the server returns its definition.

## Usage ##
The server currently only reverses strings.

    $ ruby server.rb
      > Reversal server online.
      > Waiting for connection...
      > Connection made
        > Received: Whatever you want to put here.
        > Sending: .ereh tup ot tnaw uoy revethaW
        > Connection closed
      > Waiting for connection...

    $ ruby client.rb
      > Connection made to server
      > What would you like to say?
      > Whatever you want to put here.
      > Message sent
      > Received: .ereh tup ot tnaw uoy revethaW
      > Disconnected from server
