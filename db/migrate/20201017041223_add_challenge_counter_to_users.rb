class AddChallengeCounterToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :challenge_counter, :integer, after: :number
  end
end
