class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.string :animal
      t.text :description
      t.string :submited_by
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
