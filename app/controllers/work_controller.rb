class WorkController < ApplicationController
  def work
    @user = User.find(session[:user_id])
    #user.delay(whe).gold = user.gold + 500

  end
  def workHard
    #timer
    user = User.find(session[:user_id])
    user.gold = user.lvl * 10 * 5
  end


end
