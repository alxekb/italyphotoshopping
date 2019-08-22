# frozen_string_literal: true

require 'administrate/base_dashboard'

class ProfileDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    second_name: Field::String,
    surname: Field::String,
    phone: Field::Number,
    country_code: Field::Number,
    email: Field::String,
    passport_code: Field::Number,
    passport_number: Field::Number,
    passport_date_issue: Field::DateTime,
    passport_issuer: Field::String,
    notification_number: Field::Number,
    notification_code: Field::Number,
    inn: Field::Number,
    dob: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    boxberry_office_id: Field::String
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    user
    id
    name
    second_name
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    user
    id
    name
    second_name
    surname
    phone
    country_code
    email
    passport_code
    passport_number
    passport_date_issue
    passport_issuer
    notification_number
    notification_code
    inn
    dob
    created_at
    updated_at
    boxberry_office_id
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    user
    name
    second_name
    surname
    phone
    country_code
    email
    passport_code
    passport_number
    passport_date_issue
    passport_issuer
    notification_number
    notification_code
    inn
    dob
    boxberry_office_id
  ].freeze

  # Overwrite this method to customize how profiles are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(profile)
    "#{profile.id} #{profile.name} #{profile.surname} #{profile.phone}"
  end
end
