class CreateBirds < ActiveRecord::Migration[5.0]
  def change
    create_table :birds do |t|
      t.references :tree, foreign_key: true
      t.string :name

      t.timestamps
    end
    add_index :birds, :name, unique: true
  end
end
