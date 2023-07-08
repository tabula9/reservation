class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable

  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
  mount_uploader :image, ImageUploader
  has_many :rooms
  has_many :reservations
end
