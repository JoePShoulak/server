# Dictionary Server #
## Archived ##

This is an older project of mine from earlier in my coding career. I don't feel like making it private or deleting it, but this project does not necessarily reflect my current methodology as a developer. No further changes have been made. 

## About ##
This is a program I'm writing for school that will be a server that can be accessed via the command line where the argument is a word the server returns its definition(s).

## Usage ##
The server searches through a dictionary and returns all included definitions for whatever word is sent, at an efficiency near O(log n).

```
$ ruby server.rb
> Search server online.
> Waiting for connection...
> Connection made
  > Received: 13
  > Found 13 at place 5
  > Sending: 5
  > Connection closed
> Waiting for connection...
```

```
$ ruby client.rb
> Connection made to server
> What number would you like to search for?
> 13
> Message sent
> Received: 5
> Disconnected from server
```
