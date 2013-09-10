def find_center(l) # Returns the greatest power of 2 beneath the length of l
  exp = 1
  while 2**exp < l.length # Finds the smallest power of two beneath the length of l
    exp += 1
  end
  2**(exp - 1) # Returns the above value less one
end

def binary_search(list, item) # Finds the item in O(log n)
  place = list.length / 2 # The largest power of 2 beneath list's length
  it = 1 # This is where we start
  found = false # We haven't found it yet
  while it < 2*list.length && !found # While we haven't found it and there are still places to look...
    # DEBUG INFO
    # puts "it: #{it}"
    # puts "place: #{place}"
    # puts "at place: #{list[place]}"
    if list[place] < item # Too far? Go back.
      place += list.length / (2**(it+1))
    elsif list[place] > item # Too early? Go forward.
      place -= list.length / (2**(it+1))
    elsif list[place] == item # If where we are is what we're searching for, we found it
      found = true
      multiple = []
      while list[place] == list[place-1]
        place -= 1
      end
      while list[place] == list[place+1]
        multiple += [place]
        place += 1
      end
      multiple += [place]
    end
    it += 1
  end
  if found # If we found it...
    multiple # Return the position of it in the list TODO: Return list of positions of words, when multiple entries
  else # If we didn't find it (i.e. it's not in the list)
    false # Return false
  end
end