# frozen_string_literal: true

class Api::BoxberryController < ApplicationController
  def list_points
    @points = faraday_connection.get('',
                                     method: 'ListPoints',
                                     CityCode: params[:city_code],
                                     prepaid: 1,
                                     CountryCode: '643',
                                     token: Rails.application.credentials.dig(:boxberry, :token)).body
  end

  def city
    @city = faraday_connection.get('',
                                   token: Rails.application.credentials.dig(:boxberry, :token),
                                   method: '',
                                   code: params[:code]).body
  end

  def point
    @point = faraday_connection.get('',
                                    token: Rails.application.credentials.dig(:boxberry, :token),
                                    method: 'PointsDescription',
                                    code: params[:point])
    # photo: '1',.body
  end

  private

  def faraday_connection
    url = 'http://api.boxberry.de/json.php'
    conn = Faraday.new(url: url) do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.response :json
      faraday.response :logger
    end
  end
end
