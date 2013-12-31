class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.float :quantity, required: true
      t.string :comments
      t.references :goal, index: true
      t.timestamps
    end
  end
end
