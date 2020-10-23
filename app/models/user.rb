# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bags, dependent: :destroy
  has_many :movements
  has_many :three_days_challenges, through: :movements

  def amount_change_time_passed
    update(number: number + 500)
  end
end
