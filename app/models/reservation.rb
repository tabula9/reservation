class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room
    validates :check_in, presence: true
    validates :check_out, presence: true
    validates :number_p, presence: true, numericality: true
    validate :start_end_check
    validate :zero_check
    validate :not_ago

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

    def zero_check
        if number_p.nil? || number_p < 1
            errors.add(:number_p, "には0を入力しないでください。")
        end
    end

    def not_ago
        if check_in.nil? || check_in < Date.today
            errors.add(:check_in, "には過去の日付を入力しないでください。")
        end
    end
end
