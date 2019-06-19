class PackagesController < ApplicationController
  before_action :set_package, only: [:show, :edit, :update, :destroy]

  # GET /packages
  # GET /packages.json
  def index
    @packages = Package.where('active = ?', true)
    @profiles = Profile.all
  end

  # GET /packages/1
  # GET /packages/1.json
  def show
    @deals = Deal.where('package_id = ?', @package.id)
  end

  # GET /packages/new
  def new
    @package = Package.new(package_params)
    @cities = list_cities
    # @points = list_points(16)
  end

  # GET /packages/1/edit
  def edit
  end

  # POST /packages
  # POST /packages.json
  def create
    @package = Package.new(package_params)

    respond_to do |format|
      if @package.save!
        @package_deals_ids = params[:deal_ids].split(" ").map { |s| s.to_i }

        if !@package_deals_ids.nil? &&
          @package_deals_ids.each do |d|
            deal = Deal.find_by(id: d)
            deal.status = 'Boxberry'
            deal.package_id = @package.id
            if deal.save!
              puts "Статус сделки #{deal.id} обновлен на: Boxberry."
            end
          end
        end
        puts "Посылка #{@package.id} создана! Попробуем отправить данные в Боксберри..."
        parcel_create_foreign(@package)
        format.html { redirect_to @package, notice: 'Package was successfully created.' }
        format.json { render :show, status: :created, location: @package }
      else
        format.html { render :new, notice: 'Error' }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packages/1
  # PATCH/PUT /packages/1.json
  def update
    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to @package, notice: 'Package was successfully updated.' }
        format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packages/1
  # DELETE /packages/1.json
  def destroy
    @package.destroy
    respond_to do |format|
      format.html { redirect_to packages_url, notice: 'Package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def list_points(city_code) # 68 is the Moscow code
    url = "http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=ListPoints&prepaid=1&CityCode=#{city_code}"

    conn = Faraday.new(url: url) do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.response :json
      faraday.response :logger
    end
    response = conn.get
    response.body
  end

  def point_description
    code = []
    url = 'http://api.boxberry.de/json.php'

    conn = Faraday.new(url: url) do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.response :json
      faraday.response :logger
      faraday.token_auth('86391.rfpqbbee')
    end
    response = conn.get('', method: 'PointsDescription', CountryCode: '643',
                        code: code,
                        photo: 0
                        )
    response.body
    "http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=PointsDescription&code=#{code}&photo=0"
    # Array(
    # [Name] => Наименование пункта выдачи,
    # [Organization] => Организация,
    # [ZipCode] => Индекс,
    # [Country] => Страна,
    # [Area] => Область/Край,
    # [CityCode] => Код города,
    # [CityName] => Город,
    # [Settlement] => Населенный пункт,
    # [Metro] => Станция метро,
    # [Street] => Улица,
    # [House] => Номер дома,
    # [Structure] => Строение,
    # [Housing] => Дом,
    # [Apartment] => Квартира/офис,
    # [Address] => Полный адрес,
    # [AddressReduce] => Короткий адрес,
    # [GPS] => Координаты,
    # [TripDescription] => Общая информация о местоположении,
    # [Phone] => Контактынй телефон,
    # [ForeignOnlineStoresOnly] => Только для иностранных ИМ,
    # [PrepaidOrdersOnly] => Выдача только предоплаченных заказов,
    # [Acquiring] => Эквайринг (возможность приема банковских карт, наличие терминала),
    # [DigitalSignature] => Цифровая подпись,
    # [TypeOfOffice] => Тип пункта выдачи: 1-ПВЗ, 2-СПВЗ,
    # [CourierDelivery] => Осуществляет курьерскую доставку,
    # [ReceptionLaP] => Принимает письма,
    # [DeliveryLaP] => Выдает письма,
    # [LoadLimit] => Ограничение веса, кг,
    # [VolumeLimit] => Ограничение объема,
    # [EnablePartialDelivery] => Есть частичная выдача,
    # [EnableFitting] => Есть примерка,
    # [fittingType] => Тип примерки,
    # [WorkShedule] => Расписание работы,
    # [WorkMoBegin] => Понедельник, начало рабочего дня,
    # [WorkMoEnd] => Понедельник, конец рабочего дня,
    # [WorkTuBegin] => Вторник, начало рабочего дня,
    # [WorkTuEnd] => Вторник, конец рабочего дня,
    # [WorkWeBegin] => Среда, начало рабочего дня,
    # [WorkWeEnd] => Среда, конец рабочего дня,
    # [WorkThBegin] => Четверг, начало рабочего дня,
    # [WorkThEnd] => Четверг, конец рабочего дня,
    # [WorkFrBegin] => Пятница, начало рабочего дня,
    # [WorkFrEnd] => Пятница, конец рабочего дня,
    # [WorkSaBegin] => Суббота, начало рабочего дня,
    # [WorkSaEnd] => Суббота, конец рабочего дня,
    # [WorkSuBegin] => Воскресенье, начало рабочего дня,
    # [WorkSuEnd] => Воскресенье, конец рабочего дня,
    # [LunchMoBegin] => Понедельник, обед, начало,
    # [LunchMoEnd] => Понедельник, обед, конец,
    # [LunchTuBegin] => Вторник, обед, начало,
    # [LunchTuEnd] => Вторник, обед, конец,
    # [LunchWeBegin] => Среда, обед, начало,
    # [LunchWeEnd] => Среда, обед, конец,
    # [LunchThBegin] => Четверг, обед, начало,
    # [LunchThEnd] => Четверг, обед, конец,
    # [LunchFrBegin] => Пятница, обед, начало,
    # [LunchFrEnd] => Пятница, обед, конец,
    # [LunchSaBegin] => Суббота, обед, начало,
    # [LunchSaEnd] => Суббота, обед, конец,
    # [LunchSuBegin] => Воскресенье, обед, начало,
    # [LunchSuEnd] => Воскресенье, обед, конец,
    # [Photos] => Массив с фотографиями в base64,
    # // Данные терминала, которому подчинено отделение. ,
    # // Например для Каменск-Уральского - Это "Екатеринбург (терминал)",
    # // Данные по аналогии с реквизитами самого ПВЗ: Code, Name... Префикс Terminal.
    # [TerminalCode] =>
    # [TerminalName] =>
    # [TerminalOrganization] =>
    # [TerminalCityCode] =>
    # [TerminalCityName] =>
    # [TerminalAddress] =>
    # [TerminalPhone] =>
    # [Reception] =>
    # )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_params
      params.require(:package).permit(:user_id, :item_id, :shipping_type, :pup_code, :h, :w, :l, :weight, :tracking_code, :shipping_status, :active, :profile_id, :city_code, :deal_ids)
    end

    def shipping_cost(code, weight, type, insurance, sum)
      url = 'http://api.boxberry.de/json.php'

      conn = Faraday.new(url: url) do |faraday|
        faraday.adapter Faraday.default_adapter
        faraday.response :json
        faraday.response :logger
        faraday.token_auth('86391.rfpqbbee')
      end

      # Входящие параметры:
      # weight - вес посылки в граммах,
      # type - тип доставки (1 - выдача в ПВЗ, 2 - Курьерская доставка (КД)),
      # target - код ПВЗ или почтовый индекс для type=2,
      # ordersum - cтоимость заказа в евро (0 если пустое),
      # insurance - страховка, по желанию клиента (1 - да, 0 - нет (0 если пустое)).

      response = conn.get(
        weight: weight,
        type: type,
        code: code,
        sum: sum,
        insurance: insurance
      )
      response.body
      # "http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=DeliveryCostsF&weight=#{weight}&type=#{type}&target=#{code}&ordersum=#{sum}&insurance=#{insurance}"
    end

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

    def parcel_create_foreign(parcel)
      url = 'http://api.boxberry.de/json.php'

      conn = Faraday.new(url: url) do |faraday|
        faraday.response :json
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
        # faraday.auth_token '86391.rfpqbbee'
        faraday.authorization :Token, "token" => '86391.rfpqbbee'

      end

      params = { "method" => "ParcelCreateForeign",
                  "token" => "86391.rfpqbbee",
                  "u_name" => "#{@package.profile.name}",
                  'u_surname' => "#{@package.profile.surname}",
                  'u_middlename' => "#{@package.profile.second_name}",
                  "u_email" => "#{@package.profile.email}",
                  "u_phone" => "#{@package.profile.phone}",
                  'CountryCode' => '643',
                  'u_pasport' => "#{@package.profile.passport_number}",
                  'u_passportIssued' => "#{@package.profile.passport_date_issue}",
                  'u_passportIssuedBy' => "#{@package.profile.passport_issuer}",
                  'u_destination_country_code' => "#{@package.profile.country_code}",
                  'u_city' => "#{@package.city_code}",
                  'u_take' => "#{@package.profile.boxberry_office_id}",
                  'u_post_code' => "",
                  'u_street' => "",
                  'Order' => "ips#{@package.id}",
                  'sender_tracking' => "",
                  "barcode_pallets" => "",
                  "barcode_bigbox" => "",
                  "extraPassData" => "#{@package.profile.inn}",

                  "box" => [ "x" => "#{@package.h}",
                        "y" => "#{@package.w}",
                        "z" => "#{@package.l}",
                        "weight_bruto" => "#{@package.weight}",
                        "add_tracking_code" => "",
                        "add_barcode128" => "",
                        "items" => items_in_the_box(@package),
                      ]
                }

      request = conn.post do |req|

        req.headers['Content-Type'] = 'application/json'
        # req.respond_to?  = json
        # req.respond_to?  = logger
        req.body = params.to_json
      end

      puts request.body
      if request.body.has_key?("err")
        package_rollback(parcel)
        parcel.shipping_status = request.body["err"]
        parcel.save!
        puts "######## Parcel #{parcel.id} rollback. "
      elsif request.body.has_key?("result")
        # package_success(parcel)
        parcel.active = true
        parcel.shipping_status = request.body["result"]["box"]
        parcel.label = request.body["result"]["label"]
        parcel.tracking_code = request.body["result"]["track"]
        parcel.save!
        puts "######## Parcel #{parcel.id} success!"
      end
    end

    def items_in_the_box(package)
      item = []

      package.deals.each.with_index do |deal, index|
        item[index] = {"quantity" => "1",
                "articul" => "#{deal.item.art}",
                "Manufacturer" => "#{deal.item.brand.name}",
                "model" => "#{deal.item.model.name}",
                "bruto" => "#{deal.weight}",
                "item_price" => "#{deal.item.eur_price}",
                "currency_price" => 'EUR',
                "web_address" => 'http://shop.ekaterinaivanova.com',
                "link_web" => "#{url_for(deal.item)}",
                'link_foto' => "#{url_for(deal.item.image)}",
                "country_of_origin" => '',
                "invoice" => "ips#{deal.id}",
                "descr_rus" => "#{item_full_name(deal.item.id)}",
                "descr_alt" => "#{item_full_name(deal.item.id)}",
                "descr_alt_eng" => 'true',
                "noti_num" => '',
                "noti_date" => '',
                "noti_code" => '', }
        puts "############## Итем index##{index}: item ##{item}"
        puts item.class
        puts ' '
        return item.to_a
      end

    end

    def item_full_name(item)
      @item = Item.find_by(id: item)
      return [@item.item_name.name, @item.brand.name, @item.model.name, @item.color.name, @item.size.name, '/',@item.eur_price,'EUR, EAN ', @item.ean,', ART'].join(' ')
    end

    def package_rollback(parcel)
      parcel.deals.each do |deal|
        deal.status = 'Sending error.'
        deal.package_id = nil
        puts "##### Сделка #{deal.id} убрана из посылки #{@package.id}" if deal.save!
      end
      parcel.shipping_status = 'Boxberry error'
      parcel.active = false
      parcel.save!
    end

    def package_success(parcel)

    end
end
