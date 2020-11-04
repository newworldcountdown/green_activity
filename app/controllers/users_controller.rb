# frozen_string_literal: true

class UsersController < ApplicationController

  def show
    @user = current_user
    @time = Movement.time_change(@user)

    if @user.reduction_amount >= @user.number && Time.zone.at(0) == @time
      flash.now[:congrats] = 'おめでとうございます！'
    end
    # 259200
    Time.zone.at(20) <= @time ? flash.now[:awe_some] = 'お疲れ様でした！' : nil
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
     redirect_to action: :show
    else
     redirect_to action: :edit
    end
  end

  def amount_change_success
    @user = current_user
    @movement = current_user.movements.last
    @amount = User.total_amount(@user, @movement)

    if @amount.present?
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

private

  def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
