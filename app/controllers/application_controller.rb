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

    # $data[0...n]=array(
    # 'Name'=>'Наименование города',
    # 'Code'=>'Код города в boxberry'
    # 'CountryCode' => 'Код страны',
    # 'Prefix' => 'Префикс: г - Город, п - Поселок и т.д',
    # 'ReceptionLaP' => 'Прием пип',
    # 'DeliveryLaP' => 'Выдача пип',
    # 'Reception' => 'Прием МиМ',
    # 'ForeignReceptionReturns' => 'Прием международных возвратов',
    # 'Terminal' => 'Наличие терминала',
    # 'Kladr' => 'ИД КЛАДРа',
    # 'Region' => 'Регион',
    # 'UniqName' => 'Составное уникальное имя',
    # 'District' => 'Район'
    # );
  end
end
