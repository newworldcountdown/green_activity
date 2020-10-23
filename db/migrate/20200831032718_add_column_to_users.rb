class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean, null: false, default: false, after: :id
    add_column :users, :name, :string, null: false, after: :admin
    add_column :users, :reduction_amount, :integer, default: 0, after: :name
  end
end
