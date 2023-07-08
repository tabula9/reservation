class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room
    validates :check_in, presence: true
    validates :check_out, presence: true
    validates :number_p, presence: true, numericality: true
    validate :start_end_check

    def start_end_check
        a = check_in ||1
        b = check_out ||1
        if a >= b
            errors.add(:check_out, "はチェックイン日より後の日付を選択してください。")
        end
    end
    def stay_days
        c = check_out
        d = check_in
        (c - d).to_i
    end
end
