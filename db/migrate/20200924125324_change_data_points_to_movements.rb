class ChangeDataPointsToMovements < ActiveRecord::Migration[6.0]
  def change
    change_column :movements, :points, :integer
  end
end
