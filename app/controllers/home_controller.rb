class HomeController < ApplicationController
  def show
    @user_logged = ! session[:user_id].nil?
  end
end
