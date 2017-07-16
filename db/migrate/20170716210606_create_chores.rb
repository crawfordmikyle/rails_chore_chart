class CreateChores < ActiveRecord::Migration[5.1]
  def change
    create_table :chores do |t|
      t.string :team_id
      t.string :name
      t.integer :value
      t.datetime :due_date
      t.boolean :completed, :default => false
      t.timestamps
    end
  end
end
