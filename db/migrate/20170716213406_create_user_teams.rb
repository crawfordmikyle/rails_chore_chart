class CreateUserTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :user_teams do |t|
      t.integer :user_id
      t.integer :team_id
      t.string :status, default: "Pending"
      t.timestamps
    end
  end
end
