class TrainerController < ApplicationController
  def training
    @user = User.find(session[:user_id])

  end

  def incrementStrength
    user = User.find(session[:user_id])
    upgrade_cost = ApplicationHelper::STRENGTH_COST * user.strength
    if user.gold >= upgrade_cost
        user.strength = user.strength+1
        user.gold = user.gold - upgrade_cost
        user.save
        flash[:success] = "Succes!"


    else
      flash[:warning] = "Not enough gold to upgrade strength!"
     end

    redirect_to(:action => :training)
  end
end