class PackagesController < ApplicationController
  before_action :set_package, only: [:show, :edit, :update, :destroy]

  # GET /packages
  # GET /packages.json
  def index
    @packages = Package.all
    @profiles = Profile.all
  end

  # GET /packages/1
  # GET /packages/1.json
  def show

  end

  # GET /packages/new
  def new
    @package = Package.new(package_params)
    @cities = list_cities
    @points = list_points(16)
  end

  # GET /packages/1/edit
  def edit
  end

  # POST /packages
  # POST /packages.json
  def create
    @package = Package.new(package_params)

    respond_to do |format|
      if @package.save
        format.html { redirect_to @package, notice: 'Package was successfully created.' }
        format.json { render :show, status: :created, location: @package }
      else
        format.html { render :new }
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
      params.require(:package).permit(:user_id, :item_id, :shipping_type, :pup_code, :h, :w, :l, :weight, :tracking_code, :shipping_status, :active, :profile_id)
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
        faraday.adapter Faraday.default_adapter
        faraday.response :json
        faraday.response :logger
        faraday.token_auth('86391.rfpqbbee')
      end

      user = []
      parcel = []
      box = []
      items = []

      # req = conn.post('', method: 'ParcelCreateForeign',
      #                     token: '86391.rfpqbbee',
      #                     u_name: '',
      #                     u_surname: '',
      #                     u_middlename: '',
      #                     u_email: '',
      #                     u_phone: '',
      #                     CountryCode: '643',
      #                     u_pasport: '',
      #                     u_passportIssued:
      #                     u_passportIssuedBy:
      #                     u_destination_country_code:
      #                     u_city:
      #                     u_take:
      #                     u_post_code:
      #                     u_street:
      #                     Order:
      #                     sender_tracking:
      #                     barcode_pallets:
      #                     barcode_bigbox:
      #                     extraPassData:
      #                     box: [  x:
      #                             y:
      #                             z:
      #                             weight_bruto:
      #                             add_tracking_code:
      #                             add_barcode128: ],
      #                      items: [ articul:
      #                               Manufacturer:
      #                               model:
      #                               quantity:
      #                               bruto:
      #                               item_price:
      #                               currency_price:
      #                               web_address:
      #                               link_web:
      #                               link_foto:
      #                               country_of_origin:
      #                               invoice:
      #                               descr_rus:
      #                               descr_alt:
      #                               descr_alt_eng:
      #                               noti_num:
      #                               noti_date:
      #                               noti_code:
      #                               ]
      #                     )

        # 'method' => "ParcelCreateForeign",      // Название метода (Обязателен)
        # 'token' => '86391.rfpqbbee',            // Ваш API token (Обязателен)
        #
        # 'u_name' => 'Иван',                     // Имя получателя (Обязателен)
        # 'u_surname' => 'Иванов',                // Фамилия получателя (Обязателен)
        # 'u_middlename' => 'Иванович',           // Отчество получателя (не обязателен)
        # 'u_email' => 'air@email.com',           // Электронная почта (Обязателен)
        # 'u_phone' => '+7 XXX XXX XX XX',        // Телефон получателя (Обязателен)
        # 'u_country_code' => 643,                // Код страны паспорта получателя. По умолчанию 643 - Россия. (Обязателен)
        # 'u_pasport' => 'XXXX XXXXXX',           // Номер удостоверения личности получателя (Обязателен)
        # 'u_passportIssued'=>'2017-01-01',       // Дата выдачи удостоверения личности (Обязателен)
        # 'u_passportIssuedBy'=>'',               // Кем выдано удостоверение личности (Обязателен)
        # 'u_destination_country_code' => '',     // Код страны назначения (Обязателен)
        # 'u_city' => "",                         // Город получателя (Обязателен)
        # 'u_take' => 'kd',                       // kd если курьерская доставка, или код ПВЗ (Обязателен)
        # 'u_post_code' => 'XXXXXX',              // XXXXXX - индекс города (не обязателен, если  вид доставки ПВЗ)
        # 'u_street' => '5-я Курская, д.8 кв.16', // Адрес получателя (не обязателен, если  вид доставки ПВЗ)
        # 'Order' => '123456789',                 // Номер заказа Интернет-магазина (не обязателен, в случае если не заполнено, присваивается Sender tracking)
        # 'sender_tracking' => '',                // Номер для отслеживания Интернет-магазина (не обязателен, если не заполнено, присваивается Boxberry tracking)
        # 'barcode_pallets' => 'XXXXXXXXXXX',     // Поле для передачи информации о штрихкоде паллеты (не обязателен)
        # 'barcode_bigbox' => 'XXXXXXXXXXX',      // Поле для передачи информации о штрихкоде короба (большой коробки в кот будут складываться мелкие пакеты) (не обязателен)
        # 'extraPassData' => 'XXXXXXXXXXX',       // Дополнительные данные (Для отправлений в Россию-обязательно указание ИНН для граждан РФ. Для отправлений в Казахстан-номера идентификационной карты) (не обязателен)
        # 'box' => array(                         // Массив коробок с товарами
        # array(                              // Массив одной коробки, может быть не более 5 коробок в одной посылке
        # 'x' => '10',                    // Размеры коробки в см
        # 'y' => '20',
        # 'z' => '40',
        # 'weight_bruto' => '515',        // Брутто вес коробки в граммах (Обязателен)
        # 'add_tracking_code' => '',      // Дополнительный трекинг код для личных нужд отправителя (не обязателен)
        # 'add_barcode128' => 'XXXXXXXXX',// Баркод Интернет-магазина для печати на этикетке (Вывод на этикетке – EAN, не обязателен)
        #
        # 'items' => array(                                  // Массив товаров в коробке
        #     array(                                         // Массив одного товара, их может быть сколько угодно
        #         'articul' => '1232212',                    // Артикул в магазине (Обязателен)
        #         'Manufacturer' => 'Hitachi',               // Производитель (не обязателен, No name, если не заполнено)
        #         'model' => 'DLS-118',                      // Наименование товара (Обязателен)
        #         'quantity' => '1',                         // Количество (Обязателен)
        #         'bruto' => '500',                          // Вес брутто (гр)  (Обязателен)
        #         'item_price' => '200',                     // Цена в валюте поставщика (Обязателен)
        #         'currency_price' => 'EUR',                 // Валюта поставщика EUR GBP USD RUB. При ошибочном написании или пустом поле считается EUR (Обязателен)
        #         'web_address' => ''                        // Интернет-адрес производителя
        #         'link_web' => '',                          // Ссылка на товар в интернет (Обязателен)
        #         'link_foto' => '',                         // Ссылка на товар в интернет (не обязателен)
        #         'country_of_origin' => '',                 // Страна происхождения товара (не обязателен)
        #
        #         'invoice' => 'XXXXXXXXXXXX',               // Номер заказа (Обязателен)
        #         'descr_rus' => 'Портативный аудио плеер',  // Краткое описание товара на русском (не обязателен)
        #         'descr_alt' => 'Funy audio',               // Краткое Описание товара на языке поставщика или на английском (Обязателен)
        #         'descr_alt_eng' => true,                   // Если описание на английском языке необходимо передать true
        #         'noti_num'  => 'RU0000005470',             // Номер нотификации (не обязателен)
        #         'noti_date'  => '01.01.2017',              // Срок действия нотификации (не обязателен)
        #         'noti_code'  => '01092',                   // Код нотификации (не обязателен)
        #     ),
        # ),
        # ),
        #
        # ),
        # );
    end
end
