require "sf_data/version"
require "unirest"


module SfData
  class Foodtruck
    attr_reader :applicant

    def initialize(hash)
      @applicant = hash["applicant"]
    end
    
    def self.all
      Unirest.get("https://data.sfgov.org/resource/bbb8-hzi6.json").body
    end


  end
end
