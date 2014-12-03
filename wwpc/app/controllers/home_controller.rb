class HomeController < ApplicationController
  def index
    @title = 'Home'
    @champions = Champion.all
  end

  def rules
    @title = 'The Rules'
  end

end
