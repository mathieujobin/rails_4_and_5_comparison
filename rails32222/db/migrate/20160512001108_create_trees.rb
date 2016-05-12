class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
      t.string :name

      t.timestamps
    end
    add_index :trees, :name, :unique => true
  end
end
