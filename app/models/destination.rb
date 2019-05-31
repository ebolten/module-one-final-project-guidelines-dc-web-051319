require_relative 'welcome.rb'
require_relative 'booking.rb'
require_relative 'traveller.rb'

class Destination < ActiveRecord::Base

    has_many :bookings
    has_many :travellers, through: :bookings

    def self.most_popular_city
        cities = []

        self.all.each do |destination|
            cities << destination.city
        end
        cities.detect{ |city| cities.count(city) > 1 }
    end
    
end