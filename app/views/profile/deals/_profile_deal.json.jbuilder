# frozen_string_literal: true

json.extract! profile_deal, :id, :created_at, :updated_at
json.url profile_deal_url(profile_deal, format: :json)
