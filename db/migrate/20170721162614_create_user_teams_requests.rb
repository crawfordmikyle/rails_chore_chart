class CreateUserTeamsRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :user_teams_requests do |t|
      
      t.timestamps
    end
  end
end
