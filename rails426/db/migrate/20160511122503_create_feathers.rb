class CreateFeathers < ActiveRecord::Migration
  def change
    create_table :feathers do |t|
      t.references :bird, index: true, foreign_key: true
      t.string :color
      t.integer :length

      t.timestamps null: false
    end
  end
end
