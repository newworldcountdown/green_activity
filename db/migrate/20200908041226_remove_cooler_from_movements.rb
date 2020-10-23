class RemoveCoolerFromMovements < ActiveRecord::Migration[6.0]
  def change
    remove_column :movements, :cooler, :integer
  end
end
