class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|

      t.timestamps
    end
  end
end
