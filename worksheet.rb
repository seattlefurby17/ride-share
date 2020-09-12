########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?
# Which layers of data "have" within it a different layer?
# Which layers are "next" to each other?

# There will be three layers.
# The first layer (A) is a hash - the most outer layer.
# There will be a layer (B) that will nest another layer (C) inside of (A)
# The most inner layer (C) will be next to each other within (B).

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

# The first layer (A) is a hash - the most outer layer.
# This (A) will have a key-driver ID to access an array of hashes-value
# The second layer (B) is nested in (A). (B) is an array of hashes.
# Each element of (B) is a hash. This hash (C) is most inner layer.
# Each (C) will have 4 pairing of keys and values.
# (C) is nested in (B) while B is nested in A. (C) will be next to each other within (B).

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

# The first layer (A) is a hash with driver_id as key and values are the all the trips - the most outer layer.
ride_share = {
    # The second layer (B) is nested in (A). (B) is an array of hashes.
    :DR0001 => [{
                    :date => '3rd Feb 2016',
                    :cost => 10,
                    :rider_id => 'RD0003',
                    :rating => 3
                },
                {
                    :date => '3rd Feb 2016',
                    :cost => 30,
                    :rider_id => 'RD0015',
                    :rating => 4
                },
                {
                    :date => '5th Feb 2016',
                    :cost => 45,
                    :rider_id => 'RD0003',
                    :rating => 2
                }],
    :DR0002 => [{
                    :date => '3rd Feb 2016',
                    :cost => 25,
                    :rider_id => 'RD0073',
                    :rating => 5
                },
                {
                    :date => '4th Feb 2016',
                    :cost => 15,
                    :rider_id => 'RD0013',
                    :rating => 1
                },
                {
                    :date => '5th Feb 2016',
                    :cost => 35,
                    :rider_id => 'RD0066',
                    :rating => 3
                }],
    :DR0003 => [{
                    :date => '4th Feb 2016',
                    :cost => 5,
                    :rider_id => 'RD0066',
                    :rating => 5
                },
                {
                    :date => '5th Feb 2016',
                    :cost => 50,
                    :rider_id => 'RD0003',
                    :rating => 2
                }],
    :DR0004 => [{
                    :date => '3rd Feb 2016',
                    :cost => 5,
                    :rider_id => 'RD0022',
                    :rating => 5
                },
                {
                    :date => '4th Feb 2016',
                    :cost => 10,
                    :rider_id => 'RD0022',
                    :rating => 4
                },
                {
                    :date => '5th Feb 2016',
                    :cost => 20,
                    :rider_id => 'RD0073',
                    :rating => 5
                }]
}

########################################################
# Step 4: Total Driver's Earnings and Number of Rides
   # Use an iteration blocks to print the following answers:
   # - the number of rides each driver has given
   # - the total amount of money each driver has made
   # - the average rating for each driver
   # - Which driver made the most money?
   # - Which driver has the highest average rating?

def print_statements(ride_share)
  ride_share.map do |driver_id, array_of_hashes|
    "Driver #{driver_id} has given #{array_of_hashes.count} rides, made $#{ array_of_hashes.sum do | hash |
      hash[:cost] end }, with an average rating of #{(array_of_hashes.sum do |hash|
      hash[:rating] end)/array_of_hashes.length }."
  end
end

def most_money(ride_share)
  total = ride_share.map do |driver_id, array_of_hashes|
    {:driver_id => driver_id ,:sum =>array_of_hashes.sum{ |hash|
          hash[:cost] }}
  end
  
  most_money = 0
  highest_earner = ""
  total.each do |each_driver|
    if most_money < each_driver[:sum]
     most_money = each_driver[:sum]
     highest_earner = each_driver[:driver_id]
     end
  end
  
  return "Driver #{highest_earner} made the most earning of $#{most_money}."
end

def highest_rating(ride_share)
  ratings = ride_share.map do |driver_id, array_of_hashes|
    {:driver_id => driver_id , :array_of_ratings => array_of_hashes.sum{ |hash|
      hash[:rating] }/array_of_hashes.length}
  end
  
  highest_rating = 0
  highest_rating_driver = ""
  ratings.each do |driver|
    if highest_rating < driver[:array_of_ratings]
      highest_rating = driver[:array_of_ratings]
      highest_rating_driver = driver[:driver_id]
    end
  end
  return "Driver #{highest_rating_driver} has the highest average rating of #{highest_rating}."
end

puts print_statements(ride_share)
puts most_money(ride_share)
puts highest_rating(ride_share)

 
