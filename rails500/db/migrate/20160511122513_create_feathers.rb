class CreateFeathers < ActiveRecord::Migration[5.0]
  def change
    create_table :feathers do |t|
      t.references :bird, foreign_key: true
      t.string :color
      t.integer :length

      t.timestamps
    end
  end
end
