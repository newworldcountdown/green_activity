class RemoveShowerFromMovements < ActiveRecord::Migration[6.0]
  def change
    remove_column :movements, :shower, :integer
  end
end
