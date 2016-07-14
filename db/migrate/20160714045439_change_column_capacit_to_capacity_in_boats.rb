class ChangeColumnCapacitToCapacityInBoats < ActiveRecord::Migration
  def change
  	rename_column :boats, :capacit, :capacity
  end
end
