$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'

# Find a way to accumulate the :worldwide_grosses and return that Integer
# using director_data as input
def gross_for_director(director_data)
  gross=0
  index = 0
    while director_data[:movies][index] do
      gross += director_data[:movies][index][:worldwide_gross]
      index += 1
    end
    gross
end

# Write a method that, given an NDS creates a new Hash
# The return value should be like:
#
# { directorOne => allTheMoneyTheyMade, ... }
def directors_totals(nds)
  result = {}
  index = 0 
  while nds[index] do 
    #get name of the director
    name = nds[index][:name]
    #add director's name and gross to result hash
    result[name] = gross_for_director(nds[index])
    index += 1
  end
  result
end
