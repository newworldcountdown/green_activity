class CreateThreeDaysChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :three_days_challenges do |t|
      t.integer :reduction_point
      t.string :name
      t.timestamps
    end
  end
end
