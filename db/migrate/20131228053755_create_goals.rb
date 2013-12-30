class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :description
      t.float :quantity

      t.timestamps
    end
  end
end
