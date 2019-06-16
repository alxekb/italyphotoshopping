class BoxberryController < ApplicationController

  def index
    @cost = shipping_cost
  end
  def shipping_cost #(code, weight, type, insurance, sum)
    # Входящие параметры:
    # weight - вес посылки в граммах,
    # type - тип доставки (1 - выдача в ПВЗ, 2 - Курьерская доставка (КД)),
    # target - код ПВЗ или почтовый индекс для type=2,
    # ordersum - cтоимость заказа в евро (0 если пустое),
    # insurance - страховка, по желанию клиента (1 - да, 0 - нет (0 если пустое)).

    response = Faraday.get "http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=DeliveryCostsF&weight=1000&type=1&target=96431&ordersum=100&insurance=1"
    # response = Faraday.get "http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=DeliveryCostsF&weight=#{weight}&type=#{type}&target=#{code}&ordersum=#{sum}&insurance=#{insurance}"
  end

  def list_cities
    response = Faraday.get 'http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=ListCities&CountryCode=643'

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

  def list_cities_full
    response = Faraday.get 'http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=ListCitiesFull&CountryCode=643'
    # // все отлично, ответ получен, теперь в массиве $data
    # // список всех городов где есть ПВЗ в следующем формате:
    # /*
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
    # 'PickupPoint' => 'Наличие ПВЗ'
    # 'CourierDelivery' => 'курьерская доставка',
    # );

    # например:
    # echo $data[0]['Name'];
    # echo $data[5]['Code'];
    # echo $data[0]['CountryCode'];
    # */
  end

  def list_points(city_code) # 68 is the Moscow code
    response = Faraday.get "http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=ListPoints&prepaid=1&CityCode=#{city_code}"
  end

  def list_statuses(tracking_code)
    response = Faraday.get "http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=ListStatuses&ImId=#{tracking_code}"

    # $data[0...n]=array(
    # 'Date'=>'Дата статуса в формате ДД/ММ/ГГ Ч:М:C PM/AM',
    # 'Name'=>'Наименование',
    # 'Comment'=>'Комментарий'
    # );
    #
    # например:
    # echo $data[0]['Date'];
    # echo $data[0]['Name'];
    # */
  end

  def parcel_create_foreign
    response = Faraday.get ""
  end

  def parcel_del(parcel_code)
    response = Faraday.get "http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=ParcelDel&parcelId=#{parcel_code}"
  end

  def parcel_check(parcel_code)
    response = Faraday.get "http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=ParselCheck&ImId=#{parcel_code}"
  end

  def parcel_send(parcel_data)
    conn = Faraday.new "http://api.boxberry.de"
    conn.post do |req|
      req.url '/json.php'
      req.headers['Content-Type'] = 'application/json'
      req.body = "{#{parcel_data}}"
    end
  end

  def parcel_data(parcel)

  end

  def paracel_readiness

  end
end
