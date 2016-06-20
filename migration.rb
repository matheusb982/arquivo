class ChangeStatusToOrderLog < ActiveRecord::Migration
  def up
    remove_column :order_logs, :status

    add_column :order_logs, :status, :integer, index: true, default: 0
  end
  
  def down
    add_column :order_logs, :status

    remove_column :order_logs, :status, :integer, index: true, default: 0
  end
end
