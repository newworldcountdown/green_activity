class AddNumberToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :number, :integer, default: 1000, after: :reduction_amount
  end
end
