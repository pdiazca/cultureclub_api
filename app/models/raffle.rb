class Raffle < ApplicationRecord
    validates :name, presence: true

    has_many :rafflecontestants, dependent: :delete_all
    has_many :users, through: :rafflecontestants, dependent: :delete_all
end
    