require_relative 'welcome.rb'
require_relative 'destination.rb'
require_relative 'traveller.rb'

class Booking < ActiveRecord::Base

    belongs_to :traveller
    belongs_to :destination

end

