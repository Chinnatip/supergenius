class CoursesController < ApplicationController

  layout 'dashboard'

  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
    @date_range_set = [
      {d: "จันทร์", v: "1"},
      {d: "อังคาร", v: "2"},
      {d: "พุธ", v: "3"},
      {d: "พฤหัส", v: "4"},
      {d: "ศุกร์", v: "5"},
      {d: "เสาร์", v: "6"},
      {d: "อาทิตย์", v: "7"},
    ]
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @course[:session_id] = get_session_id(params[:course])
    respond_to do |format|
      if @course.save
        # format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.html { redirect_to courses_url , notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    @course[:session_id] = get_session_id(params[:course])
    respond_to do |format|
      if @course.update(course_params)
        # format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.html { redirect_to courses_url , notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_session_id(course)
    semester_id     = course[:semester]
    grade_get       = course[:grade]
    grade_id        = ("%02d" % grade_get)
    max_session     = Course.where(semester: semester_id, grade: grade_get).maximum("session_id")[8..9].to_i rescue 0
    session_running = ("%02d" % (max_session + 1))
    session_id      = semester_id + grade_id + session_running
    return session_id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
      @date_range_set = [
        {d: "จันทร์", v: "1"},
        {d: "อังคาร", v: "2"},
        {d: "พุธ", v: "3"},
        {d: "พฤหัส", v: "4"},
        {d: "ศุกร์", v: "5"},
        {d: "เสาร์", v: "6"},
        {d: "อาทิตย์", v: "7"},
      ]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(
        :name,
        :major,
        :price,
        :grade,
        :seat,
        :semester ,
        :session_id,
        :start ,
        :end,
        :start_time,
        :end_time,
        :period,
        time_table:[],
        teacher:[]
      )
    end
end
