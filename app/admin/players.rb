ActiveAdmin.register Player do
  require 'nokogiri'
  require 'open-uri'
  menu :label => "Players", :parent => "Game Admin"


  collection_action :zeroPlayerPoints, :method => :get do
    @players=Player.find(:all)
    @players.each do |player|
      player.update_attributes(:points=>0)
    end
    redirect_to admin_players_path, :notice => "PLAYERS POINTS SET TO 0!"
  end
  
  collection_action :deletePlayers, :method => :get do
    @players=Player.find(:all)
    @players.each do |player|
      player.destroy
    end
    redirect_to admin_players_path, :notice => "PLAYERS DELETED"
  end

  collection_action :updatePlayerPoints, :method => :get do
    @players=Player.find(:all)
    @players.each do |player|
      player.points=((player.goals.to_i*3) || 0) + ((player.assists*2) || 0)
      player.update_attributes(:points => player.points)
    end
    redirect_to admin_players_path, :notice => "PLAYER POINTS SUCCESSFULLY UPDATED!"
  end
  
  collection_action :samplePlayer, :method => :get do
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
    
        redirect_to admin_players_path, :notice => "PLAYERS SUCCESSFULLY CREATED!"
  end

  collection_action :createBackPlayer, :method => :get do
    url="http://fantasyfootball.telegraph.co.uk/select-team"
    website = Nokogiri::HTML(open(url))
    elements=website.xpath('//*[@id="list-GK"]/table/tr')
    id=0
    elements.each do |row|
          x=row.xpath('td')
          name=x[0].text
          club=x[1].text
          id+=1
          Player.create!(:id=>id,:position=>'Goalkeeper', :name=>name,:club=>club)
    end
       
    elements=website.xpath('//*[@id="list-DEF"]/table/tr')
    elements.each do |row|
          x=row.xpath('td')
          name=x[0].text
          club=x[1].text
          id+=1
          Player.create!(:id=>id,:position=>'Defender', :name=>name,:club=>club)
    end
    redirect_to admin_players_path, :notice => "PLAYERS SUCCESSFULLY CREATED!"
  end
 
  collection_action :createForwardPlayer, :method => :get do
    id=Player.last.id + 1
    url="http://fantasyfootball.telegraph.co.uk/select-team"
    website = Nokogiri::HTML(open(url))
    elements=website.xpath('//*[@id="list-MID"]/table/tr')
    elements.each do |row|
          x=row.xpath('td')
          name=x[0].text
          club=x[1].text
          id+=1
          Player.create!(:id=>id,:position=>'Midfield', :name=>name,:club=>club)
    end
    
    elements=website.xpath('//*[@id="list-STR"]/table/tr')
    elements.each do |row|
          x=row.xpath('td')
          name=x[0].text
          club=x[1].text
          id+=1
          Player.create!(:id=>id,:position=>'Forward', :name=>name,:club=>club)
    end
    redirect_to admin_players_path, :notice => "PLAYERS SUCCESSFULLY CREATED!"
  end
  
  collection_action :updateAttributes, :method => :get do
    url="http://fantasyfootball.telegraph.co.uk/select-team"
    website = Nokogiri::HTML(open(url))
    elements=website.xpath('//*[@id="list-GK"]/table/tr')
    elements.each do |row|
          x=row.xpath('td')
          name=x[0].text
          club=x[1].text
          goals=x[2].text
          yc=x[4].text
          player=Player.find_by_name_and_club(name,club)
          player.update_attributes(:goals=>goals, :yellow_cards=>yc, :assists=>'2', :red_cards=>'0')
    end

    elements=website.xpath('//*[@id="list-DEF"]/table/tr')
    elements.each do |row|
          x=row.xpath('td')
          name=x[0].text
          club=x[1].text
          goals=x[5].text
          yc=x[4].text
          y= x[7].text.gsub(',','.').gsub('|',',').gsub('/',',').gsub('\'','.').split(",")
          assists=y[1]
          player=Player.find_by_name_and_club(name,club)
          player.update_attributes(:goals=>goals, :yellow_cards=>yc, :assists=>assists, :red_cards=>'0')
    end
    
        elements=website.xpath('//*[@id="list-MID"]/table/tr')
    elements.each do |row|
          x=row.xpath('td')
          name=x[0].text
          club=x[1].text
          goals=x[5].text
          yc=x[4].text
          y= x[7].text.gsub(',','.').gsub('|',',').gsub('/',',').gsub('\'','.').split(",")
          assists=y[1]
          player=Player.find_by_name_and_club(name,club)
          player.update_attributes(:goals=>goals, :yellow_cards=>yc, :assists=>assists, :red_cards=>'0')
    end
    
    elements=website.xpath('//*[@id="list-STR"]/table/tr')
    elements.each do |row|
          x=row.xpath('td')
          name=x[0].text
          club=x[1].text
          goals=x[5].text
          yc=x[4].text
          y= x[7].text.gsub(',','.').gsub('|',',').gsub('/',',').gsub('\'','.').split(",")
          assists=y[1]
          player=Player.find_by_name_and_club(name,club)
          player.update_attributes(:goals=>goals, :yellow_cards=>yc, :assists=>assists, :red_cards=>'0')
    end
    
    redirect_to admin_players_path, :notice => "PLAYER ATTRIBUTES UPDATED!"
  end
  
  index do
    column :name
    column :club
    column :position
    column :goals
    column :assists
    column :yellow_cards
    column :red_cards
    column :points
    default_actions
  end

end
