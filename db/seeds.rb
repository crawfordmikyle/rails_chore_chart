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
    {:name => "Cassy Fowller", :email => "cassy@test.com", :password => "password"},
    {:name => "Lula Host", :email => "lula@test.com", :password => "password"},
    {:name => "Lauryn Blood", :email => "lauryn@test.com", :password => "password"},
    {:name => "Darius Gobel", :email => "darius@test.com", :password => "password"},
    {:name => "Tierra Harkness", :email => "tierra@test.com", :password => "password"},
    {:name => "Odell Tisdale", :email => "odell@test.com", :password => "password"},
    {:name => "Raphael Penner", :email => "raphael@test.com", :password => "password"},
    {:name => "Cole Schoening", :email => "cole@test.com", :password => "password"},
    {:name => "Marisa Matsumoto", :email => "marisa@test.com", :password => "password"},
    {:name => "Antonette Bland", :email => "antonette@test.com", :password => "password"},
    {:name => "Brianna Saito", :email => "brianna@test.com", :password => "password"}
  ]

  user_data.each do |user|
    User.create(user)
  end
