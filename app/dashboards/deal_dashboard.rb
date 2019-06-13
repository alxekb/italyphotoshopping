require "administrate/base_dashboard"

class DealDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    profile: Field::BelongsTo,
    item: Field::BelongsTo,
    id: Field::Number,
    bye: Field::String.with_options(searchable: false),
    sell: Field::String.with_options(searchable: false),
    status: Field::String,
    messenger: Field::String,
    paid: Field::Boolean,
    ransom: Field::Boolean,
    comment: Field::Text,
    payment_method: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :profile,
    :item,
    :id,
    :bye,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :profile,
    :item,
    :id,
    :bye,
    :sell,
    :status,
    :messenger,
    :paid,
    :ransom,
    :comment,
    :payment_method,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :profile,
    :item,
    :bye,
    :sell,
    :status,
    :messenger,
    :paid,
    :ransom,
    :comment,
    :payment_method,
  ].freeze

  # Overwrite this method to customize how deals are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(deal)
  #   "Deal ##{deal.id}"
  # end
end
