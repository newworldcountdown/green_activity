class AddColumnsToMovements < ActiveRecord::Migration[6.0]
  def change
    add_column :movements, :points, :integer, null: false, default: 0, after: :user_id
  end
end
