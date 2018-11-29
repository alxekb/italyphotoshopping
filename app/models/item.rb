class Item < ApplicationRecord
  mount_uploaders :photos, PhotoUploader
end
