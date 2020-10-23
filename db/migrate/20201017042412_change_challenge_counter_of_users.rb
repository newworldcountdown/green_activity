class ChangeChallengeCounterOfUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :challenge_counter, :integer, after: :number, default: 0
  end
end
