class ChangeIdlInSetup < ActiveRecord::Migration
  def up
    remove_column :setups, :idl

    add_column :setups, :idl, :decimal, :precision => 10, :scale => 2, default: 0
  end

  def down
    #add_column :setups, :idl, :string

    remove_column :setups, :idl, :decimal, :precision => 10, :scale => 2, default: 0
  end

end
