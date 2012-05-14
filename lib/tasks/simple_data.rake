namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do

    Rake::Task['db:reset'].invoke
=begin
    User.create!(:name => "Example User",
                 :email => "example@railstutorial.org",
                 :password => "foobar",
                 :password_confirmation => "foobar",
                 :about_me =>"",
                 :location => "Location")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password,
                   :about_me =>"",
                   :location => "Location")
    end
=end

    2.times do
      User.all(:limit => 100).each do |user|
        user.teams.create!(:points => 0,
                           :name => Faker::Name.name,
                           :points => 0 )
      end
    end

     Player.create!(:name => "Example Player",
                   :club => "Club",
                   :assists => 2,
                   :yellow_cards => 2,
                   :red_cards => 3,
                   :position => "Forward",
                   :points => 0)
    100.times do |p|
      player_name = Faker::Name.name
      club = "Club"
      goals = 5
      assists = 5
      yellow_cards = 2
      red_cards = 2
      position = "Midfield"
      points = 0

    Player.create!(:name => player_name,
                   :club => club,
                   :goals => goals,
                   :assists => assists,
                   :yellow_cards => yellow_cards,
                   :red_cards => red_cards,
                   :position => position,
                   :points => points)
    end
  end
=begin
  task :add_relationships => :environment do

    Relationship.create(:player_id => 1,
                        :team_id => 1)

    teams=Team.all
    players=Player.all
    player=players[0..10]

   teams.each {|team|
     player.each{ |p|
       team_id=team.id
       player_id=p.id
       Relationship.create!(:team_id => team.id,
                            :player_id => p.id)
               }
            }
 end
=end
  task :add_admin => :environment do
    AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
  end

end