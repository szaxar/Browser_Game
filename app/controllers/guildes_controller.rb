class GuildesController < ApplicationController
  before_action :set_guilde, only: [:show, :edit, :update, :destroy]

  # GET /guildes
  # GET /guildes.json
  def index
    @guildes = Guilde.all
  end

  # GET /guildes/1
  # GET /guildes/1.json
  def show
  end

  # GET /guildes/new
  def new
    @guilde = Guilde.new
  end

  # GET /guildes/1/edit
  def edit
  end

  # POST /guildes
  # POST /guildes.json
  def create
    @guilde = Guilde.new(guilde_params)

    respond_to do |format|
      if @guilde.save
        format.html { redirect_to @guilde, notice: 'Guilde was successfully created.' }
        format.json { render :show, status: :created, location: @guilde }
      else
        format.html { render :new }
        format.json { render json: @guilde.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guildes/1
  # PATCH/PUT /guildes/1.json
  def update
    respond_to do |format|
      if @guilde.update(guilde_params)
        format.html { redirect_to @guilde, notice: 'Guilde was successfully updated.' }
        format.json { render :show, status: :ok, location: @guilde }
      else
        format.html { render :edit }
        format.json { render json: @guilde.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guildes/1
  # DELETE /guildes/1.json
  def destroy
    @guilde.destroy
    respond_to do |format|
      format.html { redirect_to guildes_url, notice: 'Guilde was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join
    @guilde = Guilde.find(params[:guilde_id])
    user = User.find(session[:user_id])
    user.guilde_id = @guilde.id
    user.save
    redirect_to '/users?guilde_id='+@guilde.id.to_s

  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guilde
      @guilde = Guilde.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guilde_params
      params.require(:guilde).permit(:name, :max_members)
    end
end
