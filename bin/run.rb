require_relative '../config/environment'
require 'pry'

# pry.start
system "clear"

puts "\n"
graffiti()

def use_app
    puts "\n"
    intro() #welcome message
    puts "\n"

    transport_method = get_method_transport() #method of transportation

    puts "\n"
    frugal_traveller_user = get_traveller() #create a new traveller
    system "clear"
    puts "\n"

    #choosing which hash to use based on user's method of transportation
    if transport_method == 'plane'
        affordable = valid_cities(city_hash_planes(),frugal_traveller_user)
    elsif transport_method == 'train'
        affordable = valid_cities(city_hash_trains(),frugal_traveller_user)
    elsif transport_method == 'bus'
        affordable = valid_cities(city_hash_buses(),frugal_traveller_user)
    end

    puts "\n"
    calculate_text()
    sleep(1)
    puts "\n"
    #if there are no cities, exit the method
    if affordable.length == 0
        puts "No Cities Match your Preferences."
        return nil
    end
    print_cities(affordable,frugal_traveller_user)
    puts "\n"
    user_city = select_city(affordable) #user selects their city
    puts "\n"
    chosen_destination = get_destination(user_city[0]) #create new destination
    system "clear"
    puts "\n"
    user_booking = get_booking(user_city[1], chosen_destination.id, frugal_traveller_user.id, transport_method)
    system "clear"
    puts "\n"
    puts "You're booking will be $#{user_booking.price}."
    puts "You have $#{frugal_traveller_user.budget.to_i - user_booking.price.to_i} left out of $#{frugal_traveller_user.budget.to_i}."
    puts "\n"

    puts "You will be leaving from #{frugal_traveller_user.start}"
    puts "You will be arriving to #{chosen_destination.city}"
    puts "\n"
    country = user_city[0].split(", ")
    country = country[1]

    new_currency(country)
end

still_booking = true
while (still_booking)
    use_app()
    puts "\n"
    puts "Would you like to make another booking? (Yes/No)"
    choice = gets.chomp.to_s

    if (choice.downcase == 'yes')
        still_booking = true
    elsif (choice.downcase == 'no')
        puts "\n"
        puts "Thank you for using the Frugal Travel app!"
        puts "\n"
        still_booking = false
        break
    else
        puts "Invalid response."
        still_booking = false
        puts "App is Closing. . ."
    end
end