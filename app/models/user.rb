class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :rafflecontestants, dependent: :delete_all
  has_many :raffles, through: :rafflecontestants, dependent: :delete_all

  acts_as_token_authenticatable
  
  validates :is_admin, inclusion: [true, false]

  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@pnimedia\.com\z/ }
end
