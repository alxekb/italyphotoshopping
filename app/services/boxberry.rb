# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'

# Boxberry api requests handling
class Boxberry
  def office_name(office_code)
    point(office_code)
  end

  def city_name(city_code)
    cities
      .select { |c| c['Code'] == city_code.to_s }
      .map    { |n| n['Name'] }.join(' ')
  end

  def cities
    faraday_token
      .get(
        '',
        method: 'ListCities',
        CountryCode: '643'
      ).body
  end

  def point(pid)
    faraday_token
      .get(
        '',
        method: 'PointsDescription',
        code: "#{pid}",
        photo: 0
      ).body
  end

  def list_points(country: 643, city: 68)
    faraday_token
      .get(
        '',
        method: 'ListPoints',
        CityCode: city,
        CountryCode: country
      ).body
  end

  def tracking_status(tracking_code)
    faraday_token
      .get(
        '',
        method: 'ListStatuses',
        ImId: tracking_code
      ).body
  end

  def delivery_cost(deal: '', profile: '')
    @profile = Profile.find_by(id: profile)
    @deal = Deal.find_by(id: deal)

    byebug
    faraday_token
      .get(
        '',
        method: 'DeliveryCostsF', insurance: '1', type: '1',
        weight: @deal.weight.to_i,
        target: @profile.boxberry_office_id,
        ordersum: @deal.bye.to_i
      ).body
  end

  def delivery_package_cost(profile: '', package: '')
    set_profile(profile)
    set_package(package)
    faraday_token.get(
      '',
        method: 'DeliveryCostsF', insurance: '1', type: '1',
        weight: @package.weight.to_i,
        target: @profile.boxberry_office_id,
        ordersum: @package.deals.pluck(:sell).sum
    ).body["price"]
  end

  def faraday_token
    Faraday.new(url: api_uri) do |req|
      req.adapter Faraday.default_adapter
      req.response :json
      req.response :logger
      req
        .params = {
          token: Rails.application.credentials.dig(:boxberry, :token)
        }
    end
  end

  def faraday_without_token
    Faraday.new(url: api_uri) do |req|
      req.adapter Faraday.default_adapter
      req.response :json
      req.response :logger
    end
  end

  private

  def api_uri
    'http://api.boxberry.de/json.php'
  end

  def set_profile(id)
    @profile = Profile.find_by(id: id)
  end

  def set_package(id)
    @package = Package.find_by(id: id)
  end
end
