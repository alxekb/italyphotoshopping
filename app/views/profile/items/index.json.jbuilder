# frozen_string_literal: true

json.array! @profile_items, partial: 'profile_items/profile_item', as: :profile_item
