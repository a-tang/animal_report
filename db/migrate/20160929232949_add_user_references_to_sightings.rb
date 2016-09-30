class AddUserReferencesToSightings < ActiveRecord::Migration
  def change
    add_reference :sightings, :user, index: true, foreign_key: true
  end
end
