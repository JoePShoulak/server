def find_center(l) # Returns the greatest power of 2 beneath the length of l
  exp = 1
  while 2**exp < l.length # Finds the smallest power of two beneath the length of l
    exp += 1
  end
  2**(exp - 1) # Returns the above value less one
end

def binary_search(list, item) # Finds the item in O(log n)
  it = find_center(list) # The largest power of 2 beneath list's length
  place = it # This is where we start
  found = false # We haven't found it yet
  while it != 0 && !found # While we haven't found it and there are still places to look...
    it /= 2
    if list[place] == item # If where we are is what we're searching for, we found it
      found = true
    elsif list[place] < item # Too far? Go back.
      place += it
    elsif list[place] > item # Too early? Go forward.
      place -= it
    end
  end
  if found # If we found it...
    place # Return the position of it in the list
  else # If we didn't find it (i.e. it's not in the list)
    false # Return false
  end
end