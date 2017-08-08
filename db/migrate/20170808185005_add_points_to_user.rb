class AddPointsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :points, :intege, default: 0
  end
end
