class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]

  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = Challenge.all
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
  end

  # GET /challenges/1/edit
  def edit
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @challenge = Challenge.new(challenge_params)
    user2 = User.find_by_nick(@challenge.defender)
    user1 = User.find(session[:user_id])
    if user2.nil?
      respond_to do |format|
        format.html { redirect_to @challenge, notice: 'User not exists' }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
        end
    else
      if not user1.busy_to.nil? and user1.busy_to > Time.now
        respond_to do |format|
          format.html { redirect_to @challenge, notice: 'User is busy until ' + user1.busy_to.to_s }
          format.json { render json: @challenge.errors, status: :unprocessable_entity }
        end
      else
      fight(user1, user2)
      respond_to do |format|
        if @challenge.save
          format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
          format.json { render :show, status: :created, location: @challenge }
        else
          format.html { render :new }
          format.json { render json: @challenge.errors, status: :unprocessable_entity }
        end


      end
      end

    end

  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to @challenge, notice: 'Challenge has ended' }
        format.json { render :show, status: :ok, location: @challenge }
      else
        format.html { render :edit }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url, notice: 'Challenge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      params.require(:challenge).permit(:attacker, :defender, :winner, :date, :gold)
    end

  def fight(user1, user2)
    user1Attacked = false
    user1Damage = [user1.attack + user1.strength - user2.defence,0].max
    user2Damage = [user2.attack + user2.strength - user1.defence ,0].max
    user1Fortune = user1.agility - user2.agility
    user2Fortune = user2.agility - user1.agility

    while user1.hp > 0 && user2.hp>0
      print(' \nuser1 ' + user1.hp.to_s + ' user2 '+user2.hp.to_s)
      if(user1Attacked)

        if rand(1..100) + user2Fortune > 50
          user1.hp = user1.hp - user2Damage
        end

        user1Attacked = false
      else
        if rand(1..100) + user1Fortune > 50
          user2.hp = user2.hp - user1Damage
        end

        user1Attacked = true

      end

    end
    @challenge.date = Time.now
    if user1.hp > user2.hp
      @challenge.winner = user1.nick
      @challenge.gold = user2.gold/10
      user1.gold = user1.gold + user2.gold/10
      user2.gold = [0, user2.gold - user2.gold/10].max
    else
      @challenge.gold = user2.gold/10
      @challenge.winner = user2.nick
      user2.gold = user2.gold + user1.gold/10
      user1.gold = [0, user1.gold - user1.gold/10].max
    end

    @challenge.attacker= user1.nick
    user1.busy_to = Time.now + 600
    user1.hp =100
    user2.hp =100
    user1.save
    user2.save
    @challenge.save


  end
end
