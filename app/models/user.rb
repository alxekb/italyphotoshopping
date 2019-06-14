class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :items
  has_many :packages
  has_many :orders
  has_many :review
  has_many :profiles, dependent: :destroy
  after_create :init_profile

  def init_profile
    self.create_profile! unless profile
  end
end
