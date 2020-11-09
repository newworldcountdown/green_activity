# frozen_string_literal: true

class MovementsController < ApplicationController
  before_action :set_movement, only: %i[show success destroy]

  def show
    @movement.present? ? @time = Time.zone.at(Time.current - @movement.created_at) : Time.zone.at(0)
  end

  def new
    @movement = Movement.new
    @three_days_challenges = ThreeDaysChallenge.all
  end

  def create
    @movement = Movement.new(movement_params)
    @movement.user_id = current_user.id

    if @movement.save
      redirect_to action: :show
    else
      redirect_to action: :new
    end
  end

  def success
    @point = @movement.three_days_challenge.reduction_point
  end

  def failed; end

  def destroy
    if @movement.destroy
      redirect_to user_path(current_user)
    else
      redirect_to action: :show
    end
  end

  private

    def set_movement
      @movement = current_user.movements.last
    end

    def movement_params
      params.require(:movement).permit(:three_days_challenge_id)
    end
end
