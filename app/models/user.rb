# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :bags, dependent: :destroy
  has_many :movements
  has_many :three_days_challenges, through: :movements

  def self.total_amount(user, movement)
    user.update(reduction_amount: user.reduction_amount + movement.three_days_challenge.reduction_point,
                number: user.number + 1000, challenge_counter: user.challenge_counter + 1)
  end
end
