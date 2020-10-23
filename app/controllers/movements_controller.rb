# frozen_string_literal: true

class MovementsController < ApplicationController
  def show
    @movement = current_user.movements.last

    if @movement.present?
      @time = Time.zone.at(Time.current - @movement.created_at)
    end
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
      render :new
    end
  end

  def success
    @movement = current_user.movements.last
    @point = @movement.three_days_challenge.reduction_point
  end

  def failed; end

  def destroy
    @movement = current_user.movements.last
    if @movement.destroy
      redirect_to user_path(current_user)
    end
  end

  private

    def movement_params
      params.require(:movement).permit(:three_days_challenge_id)
    end
end
