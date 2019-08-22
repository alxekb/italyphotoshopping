# frozen_string_literal: true

json.extract! deal, :id, :profile_id, :item_id, :bye, :sell, :status, :messenger, :paid, :ransom, :comment, :payment_method, :created_at, :updated_at
json.url deal_url(deal, format: :json)
