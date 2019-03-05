class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t| 
      t.belongs_to :user, index: true
      t.decimal :amount
      t.timestamps
    end
  end
end
