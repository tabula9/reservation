class Room < ApplicationRecord
    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, numericality: true, presence: true
    validates :address, presence: true
    belongs_to :user
    has_many :reservations
    mount_uploader :image, ImageUploader
    validate :not_zero

    def not_zero
        if price.nil? || price < 1
            errors.add(:price, "には0を入力しないでください。")
        end
    end
end
