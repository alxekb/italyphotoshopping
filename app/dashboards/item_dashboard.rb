require "administrate/base_dashboard"

class ItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    image_attachment: Field::HasOne,
    image_blob: Field::HasOne,
    order: Field::BelongsTo,
    profile_deals: Field::HasMany,
    id: Field::Number,
    item: Field::String,
    brand: Field::String,
    name: Field::String,
    color: Field::String,
    size: Field::String,
    ean: Field::Number,
    art: Field::Number,
    price: Field::Number.with_options(decimals: 2),
    discount: Field::Number,
    available: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    photo: Field::String,
    photos: Field::String.with_options(searchable: false),
    model_id: Field::Number,
    user_id: Field::Number,
    slug: Field::String,
    eur_price: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :image_attachment,
    :image_blob,
    :order,
    :profile_deals,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :image_attachment,
    :image_blob,
    :order,
    :profile_deals,
    :id,
    :item,
    :brand,
    :name,
    :color,
    :size,
    :ean,
    :art,
    :price,
    :discount,
    :available,
    :created_at,
    :updated_at,
    :photo,
    :photos,
    :model_id,
    :user_id,
    :slug,
    :eur_price,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :image_attachment,
    :image_blob,
    :order,
    :profile_deals,
    :item,
    :brand,
    :name,
    :color,
    :size,
    :ean,
    :art,
    :price,
    :discount,
    :available,
    :photo,
    :photos,
    :model_id,
    :user_id,
    :slug,
    :eur_price,
  ].freeze

  # Overwrite this method to customize how items are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(item)
    "#{item.item} #{item.brand} #{item.name} #{item.size}"
  end
end
