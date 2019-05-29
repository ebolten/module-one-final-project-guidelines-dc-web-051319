require_relative 'destination.rb'
require_relative 'traveller.rb'
require_relative 'booking.rb'

#the welcome message
def intro
    puts "Welcome to Frugal Travel!"
end

#returns a new traveller object
def get_traveller
    puts "Please Enter Your Name:"
    name = gets.chomp.to_s

    puts "Please Enter Your Start Location:"
    start = gets.chomp.to_s

    puts "Please Enter Your Budget:"
    budget = gets.chomp.to_i

    #creating a new traveller and adding it to the database
    traveller = Traveller.create(name:name,budget:budget,start:start)
    return traveller
end

#returns the selected method of transportation
def get_method_transport
    puts "Will you be using a:"
    puts "1. Plane\n2. Train\n3. Bus"
    user_input = gets.chomp.to_i

    if user_input == 1
        return "plane"
    elsif user_input == 2
        return "train"
    elsif user_input == 3
        return "bus"
    else
        puts "invalid input"
        return get_method_transport()
    end
end

#returns boolean if user is travelling internationally
def travel_internationally?
    puts "Will you be traveling internationally?"
    puts "1. Yes\n2. No"
    choice = gets.chomp.to_i

    if choice == 1
        return true
    elsif choice == 2
        return false
    else
        puts "invalid input"
        return travel_internationally?()
    end
end

#will create a new destination based on chosen city
def get_destination(city)
    destination = Destination.create(city:city)
end

#will create a new destination based on chosen city
def get_booking()
end

#message while calulating city
def calculate_text
    puts "Calculating travel destinations based on your budget. . ."
end

#returns the hash of cities
def city_hash
    cities = {
        "Tokyo" => 5,
        "Seattle" => 1,
        "Istanbul" => 4
    }
    return cities
end

#will output all the cities to the user
def output_cities(city_hash)
    city_hash.each do |city,price|
        puts "#{city}: $#{price}"
    end
end

#returns the user's selected city
def select_city
    puts "Choose Your Destination:"
    user_choice = gets.chomp.to_s
    return user_choice
end

