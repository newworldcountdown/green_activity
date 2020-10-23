class AddNameToMovements < ActiveRecord::Migration[6.0]
  def change
    add_column :movements, :name, :string, after: :points
  end
end
