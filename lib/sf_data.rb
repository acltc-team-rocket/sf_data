require "sf_data/version"
require "unirest"


module SfData
  class Foodtruck
    attr_reader :applicant, :optionaltext, :dayofweekstr, :starttime

    def initialize(hash)
      @applicant = hash["applicant"]
      @optionaltext = hash["optionaltext"]
      @dayofweekstr = hash["dayofweekstr"]
      @starttime = hash["starttime"]
    end
    
    def self.all
      foodtrucks_array = Unirest.get("https://data.sfgov.org/resource/bbb8-hzi6.json").body
      create_foodtrucks(foodtrucks_array)
    end

    def self.search(search_term)
      foodtrucks_array = Unirest.get("https://data.sfgov.org/resource/bbb8-hzi6.json?$q=#{search_term}").body
      create_foodtrucks(foodtrucks_array)
    end


    def self.create_foodtrucks(foodtrucks_array)
      foodtrucks = []
      foodtrucks_array.each do |foodtruck_hash|
        foodtrucks << Foodtruck.new(foodtruck_hash)
      end
      return foodtrucks
    end


  end
end
