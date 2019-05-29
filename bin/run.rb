require_relative '../config/environment'
require 'pry'

# pry.start

puts "\n"
intro() #welcome message
transport_method = get_method_transport() #method of transportation
puts "\n"
frugal_traveller_user = get_traveller() #create a new traveller
puts "\n"
affordable = valid_cities(city_hash_planes(),frugal_traveller_user)
puts "\n"
print_cities(affordable,frugal_traveller_user)
puts "\n"
user_city = select_city(affordable) #user selects their city
puts "\n"
get_destination(user_city) #create new destination



puts "-----TESTING-----"



puts "-----TESTING-----"