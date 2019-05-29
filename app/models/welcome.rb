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
    return destination
end

#will create a new destination based on chosen city
def get_booking()
end

#message while calulating city
def calculate_text
    puts "Calculating travel destinations based on your budget. . ."
end

#returns the hash of cities to travel to by plane
def city_hash_planes
    cities = {
        "Tokyo, Japan" => 920,
        "Sapporo, Japan" => 1700,
        "Seattle Washington, United States" => 80,
        "Istanbul, Turkey" => 526,
        "Düsseldorf, Germany" => 413,
        "Austin Texas, United States" => 130
    }
    return cities
end

#returns the hash of cities to travel to by train
def city_hash_trains
    cities = {
        "Tokyo, Japan" => 920,
        "Sapporo, Japan" => 1700,
        "Seattle Washington, United States" => 80,
        "Istanbul, Turkey" => 526,
        "Düsseldorf, Germany" => 413,
        "Austin Texas, United States" => 130
    }
    return cities
end

#returns the hash of cities to travel to by train
def city_hash_buses
    cities = {
        "Tokyo, Japan" => 920,
        "Sapporo, Japan" => 1700,
        "Seattle Washington, United States" => 80,
        "Istanbul, Turkey" => 526,
        "Düsseldorf, Germany" => 413,
        "Austin Texas, United States" => 130
    }
    return cities
end

#will output all the cities to the user
def valid_cities(city_hash,traveller)
    non_international_cities = {}

    if travel_internationally?() == false
        traveller_country = traveller.start.split(", ")
        city_hash.each do |city,price|
            array_city = city.split(", ")

            if traveller_country[1] == array_city[1]
                non_international_cities[city] = price
            end
        end
        city_hash = non_international_cities
    end
    return city_hash
end

#print valid cities
def print_cities(city_hash,traveller)
    affordable_cities = {}
    city_hash.each do |city,price|
        if price <= traveller.budget
            puts "#{city}: $#{price}"
            affordable_cities[city] = price
        end
    end
    return affordable_cities
end

#returns the user's selected city
def select_city(cities_you_can_afford)
    puts "Choose Your Destination:"
    user_choice = gets.chomp.to_s

    cities_you_can_afford.find do |city,price|
        user_choice == city
    end
end
