class WorkController < ApplicationController
  def work
    @user = User.find(session[:user_id])
    #user.delay(whe).gold = user.gold + 500

  end
  def workHard

    user = User.find(session[:user_id])
    if not user.busy_to.nil? and user.busy_to > Time.now
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
        format.html { redirect_to '/work/work/', notice: 'User is busy until ' + user.busy_to.to_s }
        format.json { render json: "", status: :unprocessable_entity }
      end
    end

  end


end
