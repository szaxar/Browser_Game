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

  def incrementAttack
    user = User.find(session[:user_id])
    upgrade_cost = ApplicationHelper::ATTACK_COST* user.attack
    if user.gold >= upgrade_cost
      user.attack = user.attack+1
      user.gold = user.gold - upgrade_cost
      user.save
      flash[:success] = "Succes!"
    else
      flash[:warning] = "Not enough gold to upgrade attack!"
    end
    redirect_to(:action => :training)
  end


  def incrementDefence
    user = User.find(session[:user_id])
    upgrade_cost = ApplicationHelper::DEFENCE_COST* user.defence
    if user.gold >= upgrade_cost
      user.defence = user.defence+1
      user.gold = user.gold - upgrade_cost
      user.save
      flash[:success] = "Succes!"
    else
      flash[:warning] = "Not enough gold to upgrade defence!"
    end
    redirect_to(:action => :training)
  end

  def incrementAgility
    user = User.find(session[:user_id])
    upgrade_cost = ApplicationHelper::AGILITY_COST* user.agility
    if user.gold >= upgrade_cost
      user.agility = user.agility+1
      user.gold = user.gold - upgrade_cost
      user.save
      flash[:success] = "Succes!"
    else
      flash[:warning] = "Not enough gold to upgrade agility!"
    end
    redirect_to(:action => :training)
  end


end