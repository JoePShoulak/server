# Dictionary Server #

## About ##
This is a program I'm writing for school that will be a server that can be accessed via the command line where the argument is a word the server returns its definition.

## Usage ##
The server currently searches through Fibonacci numbers with efficieny of O(log n)

    $ ruby server.rb
      > Reversal server online.
      > Waiting for connection...
      > Connection made
        > Received: 13
        > Found 13 at place 5
        > Sending: 5
        > Connection closed
      > Waiting for connection...
 
 
    $ ruby client.rb
      > Connection made to server
      > What number would you like to search for?
      > 13
      > Message sent
      > Received: 5
      > Disconnected from server
