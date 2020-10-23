class CreateBags < ActiveRecord::Migration[6.0]
  def change
    create_table :bags do |t|
      t.integer :counter
      t.belongs_to :user

      t.timestamps
    end
  end
end
