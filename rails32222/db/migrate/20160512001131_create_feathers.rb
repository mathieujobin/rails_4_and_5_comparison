class CreateFeathers < ActiveRecord::Migration
  def change
    create_table :feathers do |t|
      t.references :bird
      t.string :color
      t.integer :length

      t.timestamps
    end
    add_index :feathers, :bird_id
  end
end
