#need to seed
# User
  user_data = [
    {:name => "Bob Smith", :email => "bob@test.com", :password => "password"},
    {:name => "Max Jones", :email => "max@test.com", :password => "password"},
    {:name => "Stan Lee", :email => "stan@test.com", :password => "password"},
    {:name => "Ed Livin", :email => "ed@test.com", :password => "password"},
    {:name => "Amy Dole", :email => "amy@test.com", :password => "password"},
    {:name => "Jill Clover", :email => "jill@test.com", :password => "password"},
    {:name => "Kitty Knight", :email => "kitty@test.com", :password => "password"},
    {:name => "Cassy Fowller", :email => "cassy@test.com", :password => "password"}
  ]
  user_data.each do |user|
    User.create(user)
  end
# Team
  team_data = [
    {:name => "Team One"},
    {:name => "Team Two"},
    {:name => "Team Three"},
    {:name => "Team Four"}
  ]

  team_data.each do |team|
    Team.create(team)
  end
# User Team
  User.all.each do |user|
    if user.id <= 2
      user.user_teams.create({:team_id => 1})
    elsif user.id > 2 && user.id <= 4
      user.user_teams.create({:team_id => 2})
    elsif user.id > 4 && user.id <= 6
      user.user_teams.create({:team_id => 3})
    else
      user.user_teams.create({:team_id => 4})
    end
  end
# Chore
  chore_data = [
    {:name => "Clean Bathroom", :value => 10},
    {:name => "Clean Bedroom", :value => 5},
    {:name => "Take Out Trash", :value => 3},
    {:name => "Walk Dog", :value => 1 },
    {:name => "Cook Dinner", :value => 1 },
    {:name => "Wash Laundry", :value => 3 }
    ]

    Team.all.each do |team|
      chore_data.each do |chore|
        team.chores.create(chore)
      end
    end
# Task

# Frindship
  friends =  [
    {:friend_id => 2, :user_id => 1},
    {:friend_id => 2, :user_id => 3},
    {:friend_id => 2, :user_id => 4},
    {:friend_id => 1, :user_id => 2},
    {:friend_id => 3, :user_id => 2},
    {:friend_id => 4, :user_id => 2},
  ]

  friends.each do |fr|
    Friendship.create(fr)
  end
