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
# Chore

# Team
# Task
# Frindship
# User Team
