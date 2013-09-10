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
  while 2**it < list.length && !found # While we haven't found it and there are still places to look...
    if list[place] < item # Too far? Go back.
      place += list.length / (2**(it+1))
    elsif list[place] > item # Too early? Go forward.
      place -= list.length / (2**(it+1))
    elsif list[place] == item # If where we are is what we're searching for, we found it
      found = true # We found something
      multiple = [] # Initiate empty array
      while list[place] == list[place-1] # While the previous entry is the same as this one...
        place -= 1 # Move to the previous entry
      end
      while list[place] == list[place+1] # While the next entry is the same as this one...
        multiple += [place] # Add the entry to the list
        place += 1 # Move forward 1.
      end
      multiple += [place] # Add the final entry
    end
    it += 1 # Move to the next iteration
  end
  if found # If we found it...
    multiple # Return an array of all the positions of the words found
  else # If we didn't find it (i.e. it's not in the list)
    false # Return false
  end
end