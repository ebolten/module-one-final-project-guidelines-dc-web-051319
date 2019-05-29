require_relative 'welcome.rb'
require_relative 'booking.rb'
require_relative 'destination.rb'

class Traveller < ActiveRecord::Base
    
    has_many :bookings
    has_many :destinations, through: :bookings

end