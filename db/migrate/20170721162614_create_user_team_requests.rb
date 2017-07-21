class CreateUserTeamRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :user_team_requests do |t|
      t.integer :user_id
      t.integer :team_id
      t.string :status, default: "Pending"
      t.timestamps
    end
  end
end
