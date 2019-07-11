class Raffle < ApplicationRecord
    validates :name, presence: true

    has_many :raffle_contestants
    has_many :users, through: :raffle_contestants
end
