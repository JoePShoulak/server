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
    end
    it += 1 # Move to the next iteration
  end
  multiple = [] # Initiate empty array
  while list[place] == list[place-1] # While this is not the first duplicate entry... TODO: Maximize the efficiency of finding first entry when there are duplicates
    place -= 1 # Move to the previous entry
  end
  while list[place] == list[place+1] # While the next entry is the same as this one...
    multiple += [place] # Add the entry to the list
    place += 1 # Move forward 1.
  end
  multiple += [place] # Add the final entry
  if found # If we found it...
    multiple # Return an array of all the positions of the words found
  else # If we didn't find it (i.e. it's not in the list)
    false # Return false
  end
end