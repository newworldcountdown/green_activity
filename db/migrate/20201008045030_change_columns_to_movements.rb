class ChangeColumnsToMovements < ActiveRecord::Migration[6.0]
  def change
    remove_column :movements, :points, :integer
    remove_column :movements, :name, :string

    add_reference :movements, :three_days_challenge, foreign_key: true
  end
end
