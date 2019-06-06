class BoxberryController < ApplicationController
  require 'faraday'
  require 'faraday_middleware'

  def list_cities
    # url = 'http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=ListCitiesFull&CountryCode=643'
    response = Faraday.get 'http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=ListCitiesFull&CountryCode=643'
    # byebug
  end
end
