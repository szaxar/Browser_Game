class ExpeditionsController < ApplicationController
  before_action :set_expedition, only: [:show, :edit, :update, :destroy]

  # GET /expeditions
  # GET /expeditions.json
  def index
    @expeditions = Expedition.all
  end

  # GET /expeditions/1
  # GET /expeditions/1.json
  def show
  end

  # GET /expeditions/new
  def new
    @expedition = Expedition.new
  end

  # GET /expeditions/1/edit
  def edit
  end

  # POST /expeditions
  # POST /expeditions.json
  def create
    @expedition = Expedition.new(expedition_params)

    respond_to do |format|
      if @expedition.save
        format.html { redirect_to @expedition, notice: 'Expedition was successfully created.' }
        format.json { render :show, status: :created, location: @expedition }
      else
        format.html { render :new }
        format.json { render json: @expedition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expeditions/1
  # PATCH/PUT /expeditions/1.json
  def update
    respond_to do |format|
      if @expedition.update(expedition_params)
        format.html { redirect_to @expedition, notice: 'Expedition was successfully updated.' }
        format.json { render :show, status: :ok, location: @expedition }
      else
        format.html { render :edit }
        format.json { render json: @expedition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expeditions/1
  # DELETE /expeditions/1.json
  def destroy
    @expedition.destroy
    respond_to do |format|
      format.html { redirect_to expeditions_url, notice: 'Expedition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def start
    user1 = User.find(session[:user_id])
    @expedition = Expedition.find(params[:expedition_id])
    if user1.busy_to.nil?
      user1.busy_to = Time.now - 1
      user1.save
    end

    if  user1.busy_to > Time.now
      respond_to do |format|
        format.html { redirect_to @expedition, notice: 'User is busy for ' + (user1.busy_to - Time.now).to_s+'s' }

        format.json { render json: @expedition.errors, status: :unprocessable_entity }
      end
    else

      if user1.lvl < @expedition.requiredLevel
        respond_to do |format|
          format.html { redirect_to @expedition, notice: 'User has not enough level ' }
          format.json { render json: @expedition.errors, status: :unprocessable_entity }
        end
      else
        expedition(user1)
          respond_to do |format|

            format.html { redirect_to @expedition, notice: 'Expediton was successfully created.' }
            format.json { render :show, status: :created, location: @expedition }
        end
      end
    end
  end



  def expedition(user)
    @expedition = Expedition.find(params[:expedition_id])
    userAttacked = false
    userDamage = [user.attack + user.strength - @expedition.enemyDefence,0].max
    enemyDamage = [@expedition.enemyAttack + @expedition.enemyStrength - user.defence ,0].max
    userFortune = user.agility - @expedition.enemyAgility
    enemyFortune = user.agility - @expedition.enemyAgility

    while user.hp > 0 && @expedition.enemyHp>0

      if(userAttacked)

        if rand(1..100) + enemyFortune > 50
          user.hp = user.hp - enemyDamage
        end

        userAttacked = false
      else
        if rand(1..100) + userFortune > 50
          @expedition.enemyHp=@expedition.enemyHp - userDamage
        end

        userAttacked = true

      end

    end

    if user.hp > @expedition.enemyHp
      user.gold = user.gold + @expedition.gainedGold
      user.experience = user.experience + @expedition.gainedExperience
      while(user.experience>=100)
        user.lvl=user.lvl+1
        user.experience=user.experience-100
      end
    end

    user.busy_to = Time.now + @expedition.duration
    user.hp =100
    user.save

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expedition
      @expedition = Expedition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expedition_params
      params.require(:expedition).permit(:name, :duration, :requiredLevel, :gainedExperience, :gainedGold, :enemyAttack, :enemyDefence, :enemyStrength, :enemyAgility, :enemyHp)
    end
end
