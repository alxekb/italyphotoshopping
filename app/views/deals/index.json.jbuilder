# frozen_string_literal: true

json.array! @deals, partial: 'deals/deal', as: :deal
