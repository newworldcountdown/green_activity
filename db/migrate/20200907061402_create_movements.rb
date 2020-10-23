class CreateMovements < ActiveRecord::Migration[6.0]
  def change
    create_table :movements do |t|
      t.integer :cooler
      t.integer :heater
      t.integer :shower
      t.integer :idling
      t.belongs_to :user, optional: true
      t.timestamps
    end
  end
end
