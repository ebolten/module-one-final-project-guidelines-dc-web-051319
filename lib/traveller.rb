
class Traveller < ActiveRecord::Base
    attr_reader :name,:budget,:location
    
    #initialize with a name, a budget and a start locations
    def initialize(name,budget,location)
        @name = name
        @budget = budget
        @location = location
    end
end