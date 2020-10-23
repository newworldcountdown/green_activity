class RemoveHeaterFromMovements < ActiveRecord::Migration[6.0]
  def change
    remove_column :movements, :heater, :integer
  end
end
