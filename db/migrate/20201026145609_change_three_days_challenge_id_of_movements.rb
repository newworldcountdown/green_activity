class ChangeThreeDaysChallengeIdOfMovements < ActiveRecord::Migration[6.0]
  def change
    change_column :movements, :three_days_challenge_id, :bigint, after: :user_id
  end
end
