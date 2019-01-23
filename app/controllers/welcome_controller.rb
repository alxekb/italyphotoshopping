class WelcomeController < ApplicationController
  def index
  end

  def boxberry_cities_list
    # http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=ListCities&CountryCode=643
  end

  def boxberry_points_list
    # http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=ListCitiesFull&CountryCode=643
  end

end
