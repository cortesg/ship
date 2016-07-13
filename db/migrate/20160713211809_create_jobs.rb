class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.integer :container
      t.string :cargo
      t.string :origin
      t.decimal :cost
      t.string :destination

      t.timestamps null: false
    end
  end
end
