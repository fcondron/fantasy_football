class PagesController < ApplicationController
  def home
    @title="Home"
    @articles = Article.last(5)
  end

  def contact
    @title="Contact"
  end

  def about
    @title="About"
  end

  def help
    @title="Help"
  end

end
