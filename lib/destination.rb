
class Destination < ActiveRecord::Base
    attr_reader :city
    
    #initialized with a city
    def initialize(city)
        @city = city
    end
end