require_relative 'welcome.rb'
require_relative 'booking.rb'
require_relative 'traveller.rb'

class Destination < ActiveRecord::Base

    has_many :bookings
    has_many :travellers, through: :bookings
    
end