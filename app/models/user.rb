class User < ApplicationRecord
  acts_as_token_authenticatable

  has_many :raffle_contestants
  has_many :raffles, through: :raffle_contestants

  validates :is_admin, inclusion: [true, false]

  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@pnimedia\.com\z/ }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
