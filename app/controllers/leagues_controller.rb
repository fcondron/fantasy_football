class LeaguesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @title = "All tables"
    @leagues = League.paginate(:page => params[:page])
  end

  def show
    @league= League.find(params[:id])
    @title = @league.name
    @teams = @league.teams.sort! { |a,b| 
      if a.points.nil? then
          a.points = 0
      elsif b.points.nil?
        b.points = 0
      end 
      b.points<=>a.points }
  end

end
