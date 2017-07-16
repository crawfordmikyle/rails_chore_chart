class CreateChores < ActiveRecord::Migration[5.1]
  def change
    create_table :chores do |t|

      t.timestamps
    end
  end
end
