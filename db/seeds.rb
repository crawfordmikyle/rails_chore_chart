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
