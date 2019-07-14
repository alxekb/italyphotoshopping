class ApplicationController < ActionController::Base
  require 'faraday'
  require 'faraday_middleware'
  include Pundit

  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def list_cities
    url = 'http://api.boxberry.de/json.php'

    conn = Faraday.new(url: url) do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.response :json
      faraday.response :logger
    end

    response = conn.get('', CountryCode: '643', method: 'ListCities', token: Rails.application.credentials.dig(:boxberry, :token))
    response.body
  end

  def list_points(city_code)
    url = "http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=ListPoints&prepaid=1&CityCode=#{city_code}"

    conn = Faraday.new(url: url) do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.response :json
      faraday.response :logger
    end
    response = conn.get
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

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    redirect_to(request.referrer || root_path)
    flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
  end
end
