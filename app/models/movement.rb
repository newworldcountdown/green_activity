# frozen_string_literal: true

class Movement < ApplicationRecord
  belongs_to :user
  belongs_to :three_days_challenge

  def self.time_change(user)
    user.movements.last
    user.movements.last.present? ? Time.zone.at(Time.current - user.movements.last.created_at) : Time.zone.at(0)
  end
end
