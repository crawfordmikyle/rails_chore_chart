class CreateUserTeamsRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :user_teams_requests do |t|
      t.integer :user_id
      t.integer :friend_id
      t.string :status, default: "Pending"
      t.timestamps
    end
  end
end
