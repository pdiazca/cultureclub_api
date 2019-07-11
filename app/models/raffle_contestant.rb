class RaffleContestant < ApplicationRecord
  belongs_to :user_id
  belongs_to :raffle_id
end
