class ConfigursController < ApplicationController
  layout 'dashboard'

  before_action :authenticate_user!
  before_action :set_configur, only: [:show, :edit, :update, :destroy]

  # GET /configurs
  # GET /configurs.json
  def index
    @configurs = Configur.all
  end

  # GET /configurs/1
  # GET /configurs/1.json
  def show
  end

  # GET /configurs/new
  def new
    @configur = Configur.new
  end

  # GET /configurs/1/edit
  def edit
  end

  # POST /configurs
  # POST /configurs.json
  def create
    @configur = Configur.new(configur_params)

    respond_to do |format|
      if @configur.save
        format.html { redirect_to @configur, notice: 'Configur was successfully created.' }
        format.json { render :show, status: :created, location: @configur }
      else
        format.html { render :new }
        format.json { render json: @configur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /configurs/1
  # PATCH/PUT /configurs/1.json
  def update
    respond_to do |format|
      if @configur.update(configur_params)
        format.html { redirect_to @configur, notice: 'Configur was successfully updated.' }
        format.json { render :show, status: :ok, location: @configur }
      else
        format.html { render :edit }
        format.json { render json: @configur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configurs/1
  # DELETE /configurs/1.json
  def destroy
    @configur.destroy
    respond_to do |format|
      format.html { redirect_to configurs_url, notice: 'Configur was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configur
      @configur = Configur.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def configur_params
      params.require(:configur).permit(:top_contact, :company_name, :contact_info, :home_slider)
    end
end
