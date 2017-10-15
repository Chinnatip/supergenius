class AddcoursesController < ApplicationController
  layout 'dashboard'
  before_action :set_addcourse, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /addcourses
  # GET /addcourses.json
  def index
    @addcourses = Addcourse.all
  end

  # GET /addcourses/1
  # GET /addcourses/1.json
  def show
    @course_detail = Addcourse.details(@addcourse)
  end

  # GET /addcourses/new
  def new
    setup_course_type
    @type   = params[:type].present?   ? params[:type] : ''
    @course = params[:course].present? ? params[:course] : ''
    @addcourse = Addcourse.new
  end

  # GET /addcourses/1/edit
  def edit
    setup_course_type
    @type   = @addcourse[:add_type]
    @course = @addcourse[:course]
  end

  # POST /addcourses
  # POST /addcourses.json
  def create
    @addcourse = Addcourse.new(addcourse_params)
    respond_to do |format|
      if @addcourse.save
        # format.html { redirect_to @addcourse, notice: 'Addcourse was successfully created.' }
        format.html { redirect_to courses_path , notice: 'สร้างรายการนัดเพิ่มเติมเเล้ว' }
        format.json { render :show, status: :created, location: @addcourse }
      else
        format.html { render :new }
        format.json { render json: @addcourse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addcourses/1
  # PATCH/PUT /addcourses/1.json
  def update
    respond_to do |format|
      if @addcourse.update(addcourse_params)
        # format.html { redirect_to @addcourse, notice: 'Addcourse was successfully updated.' }
        format.html { redirect_to courses_path , notice: 'แก้ไขรายการนัดเพิ่มเติมเเล้ว' }
        format.json { render :show, status: :ok, location: @addcourse }
      else
        format.html { render :edit }
        format.json { render json: @addcourse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addcourses/1
  # DELETE /addcourses/1.json
  def destroy
    @addcourse.destroy
    respond_to do |format|
      format.html { redirect_to addcourses_url, notice: 'Addcourse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_addcourse
      @addcourse = Addcourse.find(params[:id])
    end

    def setup_course_type
      @type_lists = [
        {t: "นัดเรียนเพิ่ม", v: "extra"},
        {t: "นัดเรียนแก้", v: "fixed"},
      ]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def addcourse_params
      params.require(:addcourse).permit(:type, :course, :desc, :add_type)
    end
end
