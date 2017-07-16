class CreateUserteams < ActiveRecord::Migration[5.1]
  def change
    create_table :userteams do |t|

      t.timestamps
    end
  end
end
