# frozen_string_literal: true

class ThreeDaysChallenge < ApplicationRecord
  has_many :movements
  has_many :users, through: :movements
end
