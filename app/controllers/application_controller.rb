class ApplicationController < ActionController::Base
  require 'faraday'
  require 'faraday_middleware'
  include Pundit

  protect_from_forgery with: :exception

  def list_cities
    url = 'http://api.boxberry.de/json.php'

    conn = Faraday.new(url: url) do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.response :json
      faraday.response :logger
    end

    response = conn.get('', CountryCode: '643', method: 'ListCities', token: '86391.rfpqbbee')
    response.body
  end

  def shipping_cost(code, weight, type, insurance, sum)
    url = "http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=DeliveryCostsF&weight=#{weight}&type=#{type}&target=#{code}&ordersum=#{sum}&insurance=#{insurance}"

    conn = Faraday.new(url: url) do |faraday|
      faraday.response :json
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get
    response.body
  end

  def tracking_status(tracking_code)
    url = "http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=ListStatuses&ImId=#{tracking_code}"

    conn = Faraday.new(url: url) do |faraday|
      faraday.response :json
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get
    response.body
  end
end
