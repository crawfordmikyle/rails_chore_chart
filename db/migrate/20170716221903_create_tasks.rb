class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :chore_id
      t.timestamps
    end
  end
end
