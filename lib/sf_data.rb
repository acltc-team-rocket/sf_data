require "sf_data/version"
require "unirest"


module SfData
  class Foodtruck
    attr_reader :applicant

    def initialize(hash)
      @applicant = hash["applicant"]
    end
    
    def self.all
      foodtrucks_array = Unirest.get("https://data.sfgov.org/resource/bbb8-hzi6.json").body
      create_foodtrucks(foodtrucks_array)
    end

    def self.create_foodtrucks(foodtrucks_array)
      # create ruby objects
    end
  end
end
