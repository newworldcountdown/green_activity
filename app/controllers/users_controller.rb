# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = current_user
    @time = Movement.time_change(@user)
    # @time = Time.at(0)

    if @user.reduction_amount >= @user.number && Time.at(0) == @time
      flash.now[:congrats] = 'おめでとうございます！'
    end

    if Time.at(20) <= @time
      flash.now[:awe_some] = 'お疲れ様でした！'
    # elsif Time.zone.at(30000) < @time
    #   @user.amount_change_time_passed
    #   redirect_to movements_destroy_path
    # && Time.zone.at(30000) > @time
    end
  end

  def amount_change_success
    @user = current_user
    @movement = current_user.movements.last
    if current_user.update(reduction_amount: @user.reduction_amount + @movement.three_days_challenge.reduction_point,
                           number: @user.number + 1000, challenge_counter: @user.challenge_counter + 1)
      redirect_to movements_success_path
    else
      redirect_to action: :show
    end
  end

  def amount_change_failed
    if current_user.update(number: current_user.number + 1000)
      redirect_to movements_failed_path
    else
      redirect_to action: :show
    end
  end
end
