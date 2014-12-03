class AdminController < ApplicationController
  def index
    @title = 'Admin'
    @users = User.all
  end

  def users
    @users = User.all
  end
end
