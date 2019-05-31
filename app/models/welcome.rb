require_relative 'destination.rb'
require_relative 'traveller.rb'
require_relative 'booking.rb'
require_relative 'city_hash_planes.rb'
require_relative 'city_hash_train.rb'
require_relative 'city_hash_bus.rb'

#will print a cool icon
def graffiti
    puts "  ______                      _   _______                  _ "
    puts " |  ____|                    | | |__   __|                | |"
    puts " | |__ _ __ _   _  __ _  __ _| |    | |_ __ __ ___   _____| |"
    puts " |  __| '__| | | |/ _` |/ _` | |    | | '__/ _` \\ \\ / / _ \\ |"
    puts " | |  | |  | |_| | (_| | (_| | |    | | | | (_| |\\ V /  __/ |"
    puts " |_|  |_|   \\__,_|\\__, |\\__,_|_|    |_|_|  \\__,_| \\_/ \\___|_|"
    puts "                   __/ |                                     "
    puts "                  |___/                                      "
end


#the welcome message
def intro
    puts "Welcome to Frugal Travel!"
end

#returns a new traveller object
def get_traveller
    puts "Please Enter Your Name:"
    name = gets.chomp.to_s
    puts "\n"
    puts "Please Enter Your Start Location (City, Country):"
    start = gets.chomp.to_s
    puts "\n"
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

#message while calulating city
def calculate_text
    puts "Calculating travel destinations based on your budget. . ."
end

#will output all the cities to the user
def valid_cities(city_hash,traveller)
    non_international_cities = {}

    if travel_internationally?() == false
        traveller_country = traveller.start.split(", ")
        city_hash.each do |city,price|
            array_city = city.split(", ")

            if traveller_country[1] == array_city[1]
                percent_off = price * 0.5
                price -= percent_off
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
    puts "Choose Your Destination (City, Country):"
    user_choice = gets.chomp.to_s

    affordable_city = []

    cities_you_can_afford.each do |city,price|
        if city.to_s == user_choice
            affordable_city << city
            affordable_city << price
        end
    end
    return affordable_city
end

#will create a new destination based on chosen city
def get_booking(price,traveller_id,destination_id,transportation)
    booking = Booking.create(price:price,traveller_id:traveller_id,destination_id:destination_id,transport:transportation)
    return booking
end

#the new currency
def new_currency(country)
    currency = nil
    case country
        when "United States"
            currency = "US Dollar"
        when "Italy"
            currency = "Euro"
        when "Germany"
            currency = "Euro"
        when "Luxembourg"
            currency = "Euro"
        when "United Kingdom"
            currency = "Great Britain Pound"
        when "Tunisia"
            currency = "Dinar"
        when "Russia"
            currency = "Ruble"
        when "Cuba"
            currency = "Peso"
        when "Iceland"
            currency = "Króna"
        when "Ukrain"
            currency = "Hryvnia"
        when "Czech Republic"
            currency = "Koruna"
        when "Israel"
            currency = "Shekel"
        when "Austria"
            currency = "Euro"
        when "Canada"
            currency = "Canadian Dollar"
        when "India"
            currency = "Rupee"
        when "Spain"
            currency = "Euro"
        when "Netherlands"
            currency = "Euro"
        when "Peru"
            currency = "Sole"
        when "Japan"
            currency = "Yen"
        when "Turkey"
            currency = "Lira"
        when "China"
            currency = "Yuan"
        else
            currency = "unknown for this country"
        end

        puts "The Currency You'll Need for Your Trip is the: #{currency}."
end
