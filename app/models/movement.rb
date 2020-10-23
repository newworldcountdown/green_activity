# frozen_string_literal: true

class Movement < ApplicationRecord
  belongs_to :user
  belongs_to :three_days_challenge

  def self.time_change(user)
    user.movements.last
    # 259200
    user.movements.last.present? ? Time.at(Time.current - user.movements.last.created_at) : Time.at(0)
    # 条件式 ? 真の時の値 : 偽の時の値
    # if user.movements.last.present?
    #   return Time.at(Time.current - user.movements.last.created_at)
    # else
    #   return Time.at(0)
    # end
  end
end
