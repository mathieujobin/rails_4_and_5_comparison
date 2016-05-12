class CreateBirds < ActiveRecord::Migration
  def change
    create_table :birds do |t|
      t.references :tree
      t.string :name

      t.timestamps
    end
    add_index :birds, :tree_id
    add_index :birds, :name, :unique => true
  end
end
