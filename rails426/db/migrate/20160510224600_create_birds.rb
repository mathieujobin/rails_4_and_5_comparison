class CreateBirds < ActiveRecord::Migration
  def change
    create_table :birds do |t|
      t.references :tree, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
    add_index :birds, :name, unique: true
  end
end
