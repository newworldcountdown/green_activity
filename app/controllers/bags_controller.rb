# frozen_string_literal: true

class BagsController < ApplicationController
  def new
    @bag = Bag.new
  end

  def create
    @bag = Bag.new(bag_params)
    @bag.user_id = current_user.id

    if @bag.save
      @bag.amount_transfer
      render 'result'
    else
      render :new
    end
  end

  private

    def bag_params
      params.require(:bag).permit(:counter)
    end
end
