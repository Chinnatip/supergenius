class CmsController < ApplicationController
  layout 'dashboard'

  before_action :authenticate_user!
  before_action :set_cm, only: [:show, :edit, :update, :destroy]

  # GET /cms
  # GET /cms.json
  def index
    @cms = Cm.all
  end

  # GET /cms/1
  # GET /cms/1.json
  def show
  end

  # GET /cms/new
  def new
    @cm = Cm.new
  end

  # GET /cms/1/edit
  def edit
  end

  # POST /cms
  # POST /cms.json
  def create
    @cm = Cm.new(cm_params)

    respond_to do |format|
      if @cm.save
        format.html { redirect_to @cm, notice: 'Cm was successfully created.' }
        format.json { render :show, status: :created, location: @cm }
      else
        format.html { render :new }
        format.json { render json: @cm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cms/1
  # PATCH/PUT /cms/1.json
  def update
    respond_to do |format|
      if @cm.update(cm_params)
        format.html { redirect_to @cm, notice: 'Cm was successfully updated.' }
        format.json { render :show, status: :ok, location: @cm }
      else
        format.html { render :edit }
        format.json { render json: @cm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cms/1
  # DELETE /cms/1.json
  def destroy
    @cm.destroy
    respond_to do |format|
      format.html { redirect_to cms_url, notice: 'Cm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cm
      if params[:id].to_i != 0
        finder = Cm.find(params[:id])
      else
        finder = Cm.where(tagid: params[:id]).first
      end
      @cm = finder
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cm_params
      params.require(:cm).permit(:title, :tagid, :content, :viewer, :seo_title, :seo_description, :word_pool, :map)
    end
end
