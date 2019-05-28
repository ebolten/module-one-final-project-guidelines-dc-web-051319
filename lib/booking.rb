
class Booking < ActiveRecord::Base
    attr_reader :traveller,:destination,:price
    
    #initialize with a traveller, a destination and a price
    def initialize(traveller,destination,price)
        @traveller = traveller
        @destination = destination
        @price = price
    end
end