class RemoveIdlingFromMovements < ActiveRecord::Migration[6.0]
  def change
    remove_column :movements, :idling, :integer
  end
end
