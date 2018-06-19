class WorkController < ApplicationController
  def work
    @user = User.find(session[:user_id])
    #user.delay(whe).gold = user.gold + 500

  end
  def workHard

    user = User.find(session[:user_id])
    if user.busy_to.nil?
      user.busy_to = Time.now - 1
      user.save
    end
    if user.busy_to < Time.now
      time = params[:time]
      user.busy_to= Time.now + time.to_i
      user.gold = user.gold + user.lvl * 10 * time.to_i
      user.save()
      respond_to do |format|

        format.html { redirect_to '/work/work/', notice: 'Your character went to work' }
        format.json { render :show, status: :created, location: @expedition }
      end
    else
      respond_to do |format|
        format.html { redirect_to '/work/work/', notice: 'User is busy for ' + (user.busy_to - Time.now).to_s+'s' }
        format.json { render json: "", status: :unprocessable_entity }
      end
    end

  end


end
