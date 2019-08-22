# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'

module Boxberry
  def shipping_cost # (code, weight, type, insurance, sum)
    url = 'http://api.boxberry.de/json.php'

    conn = Faraday.new(url: url) do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.response :json
      faraday.response :logger
      faraday.token_auth(Rails.application.credentials.dig(:boxberry, :token))
    end

    # Входящие параметры:
    # weight - вес посылки в граммах,
    # type - тип доставки (1 - выдача в ПВЗ, 2 - Курьерская доставка (КД)),
    # target - код ПВЗ или почтовый индекс для type=2,
    # ordersum - cтоимость заказа в евро (0 если пустое),
    # insurance - страховка, по желанию клиента (1 - да, 0 - нет (0 если пустое)).

    response = conn.get(
      weight: '1000',
      type: '1',
      code: '96431',
      sum: '100',
      insurance: '0'
    )
    response.body
    # "http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=DeliveryCostsF&weight=#{weight}&type=#{type}&target=#{code}&ordersum=#{sum}&insurance=#{insurance}"
  end
end
