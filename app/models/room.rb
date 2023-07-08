class Room < ApplicationRecord
    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, numericality: true, presence: true
    validates :address, presence: true
    belongs_to :user
    has_many :reservations
end
