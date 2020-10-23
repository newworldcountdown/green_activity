# frozen_string_literal: true

class Bag < ApplicationRecord
  belongs_to :user

  def amount_transfer
    user.update(reduction_amount: user.reduction_amount + counter)
  end
end
