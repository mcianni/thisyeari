class AddCurrentQuantityToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :current_quantity, :float, default: 0.0
  end
end
