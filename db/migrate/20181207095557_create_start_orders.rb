class CreateStartOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :start_orders do |t|
      t.boolean :running, default: true
      t.timestamps
    end
  end
end
