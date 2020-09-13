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
# This (A) will have a key-driver ID to access an array of hashes-trips
# The second layer (B) is nested in (A). (B) is an array of hashes-rides.
# Each element of (B) is a hash/ride. This hash/ride (C) is most inner layer.
# Each ride (C) will have 4 pairing of keys and values = ride details.
# (C) is nested in (B) while B is nested in A. (C) will be next to each other within (B).

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

# The first layer (A) is a hash with driver_id as keys
# and the values are all the trips' details - the most outer layer.
ride_share = {
  # The second layer (B) is nested in (A). (B) is an array of hashes.
  # Each hash contained a trip's detail. This is also the last and inner layer.
  DR0001: [{
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
    DR0002: [{
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
    DR0003: [{
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
    DR0004: [{
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
#
def totals_from_rides(rides)
  return rides.reduce(0) {|sum, ride| sum + ride[:cost]}
end

def average_rating(rides)
  average_rating = rides.sum do |ride|
    ride[:rating]
  end
  return average_rating/rides.length.to_f
end

def print_statements(ride_share)
  ride_share.map do |driver_id, rides|
    totals = totals_from_rides(rides)
    average_rating = average_rating(rides)
    puts "Driver #{driver_id} has given #{rides.count} rides," +
    " made $#{totals}, with an average rating of #{sprintf('%0.1f',average_rating)}"
  end
end

def most_money(ride_share)
  totals = ride_share.map do |driver_id, rides|
    {:driver_id => driver_id ,:sum =>totals_from_rides(rides)}
  end

  highest_earner = totals.max_by do | highest_earning_driver|
    highest_earning_driver[:sum]
  end

  return "Driver #{highest_earner[:driver_id]} made the most earning of $#{highest_earner[:sum]}."
end

def highest_rating(ride_share)
  ratings = ride_share.map do |driver_id, rides|
    {:driver_id => driver_id , :average_rating => average_rating(rides)}
  end

  highest_rating = ratings.max_by do |highest_rating_driver|
    highest_rating_driver[:average_rating]
  end

  return "Driver #{highest_rating[:driver_id]} has " +
      " the highest average rating of #{sprintf('%0.1f', highest_rating[:average_rating])}"
end

print_statements(ride_share)
puts most_money(ride_share)
puts highest_rating(ride_share)

