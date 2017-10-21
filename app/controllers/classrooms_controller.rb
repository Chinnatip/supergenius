class ClassroomsController < ApplicationController
  layout 'dashboard'
  before_action :set_classroom, only: [:show, :edit, :update, :destroy] , except: [:class_detail]
  before_action :authenticate_user!

  def detacthed_course_spec(cs)
    course = Course.find(cs)
    grader = ['P1','P2','P3','P4','P5','P6','M1','M2','M3','M4','M5','M6']
    major   = course[:major].to_s
    grade   = grader[course[:grade].to_i - 1]
    current_year = (Time.now.strftime('%Y')[2..3].to_i + 43).to_s
    runner = Classroom.where(course: course[:id])
    if runner.count > 0
      parser = []
      runner.each do |r|
        parser << r[:spec][8..9].to_i
      end
      running = ("%02d" % (parser.max + 1))
    else
      running = '01'
    end

    return "#{major}#{current_year}#{grade}#{running}"
  end

  # GET /classrooms
  # GET /classrooms.json
  def index
    # @classrooms = Classroom.all

    search = params[:keyword] || ''
    type   = params[:type] || 'spec'
    @classrooms = Classroom.search(search,type) # .sort_by { |s| Course.find(s[:course])[:grade]  }
  end

  # GET /classrooms/1
  # GET /classrooms/1.json
  def show
  end

  # GET /classrooms/new
  def new
    @classroom = Classroom.new
  end

  # GET /classrooms/1/edit
  def edit
  end

  def class_detail
    @seats   = Seat.where(classroom: params[:id])
    @periods = Classroom.find(params[:id])[:period] + 1
    @current_period = Classroom.find(params[:id])[:current]
    @inspect_class_button = "อัพเดทคะเเนนครั้งที่ #{@current_period}"
  end

  # POST /classrooms
  # POST /classrooms.json
  def create
    @classroom = Classroom.new(classroom_params)
    @classroom[:spec] = detacthed_course_spec(params[:classroom][:course])
    respond_to do |format|
      if @classroom.save
        format.html { redirect_to classrooms_url, notice: 'Classroom was successfully created.' }
        format.json { render :show, status: :created, location: @classroom }
      else
        format.html { render :new }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classrooms/1
  # PATCH/PUT /classrooms/1.json
  def update
    respond_to do |format|
      if @classroom.update(classroom_params)
        format.html { redirect_to classrooms_url, notice: 'Classroom was successfully updated.' }
        format.json { render :show, status: :ok, location: @classroom }
      else
        format.html { render :edit }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.json
  def destroy
    @classroom.destroy
    respond_to do |format|
      format.html { redirect_to classrooms_url, notice: 'Classroom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])  rescue ''
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classroom_params
      params.require(:classroom).permit(:name, :spec, :course, :teacher, :seat, :booked, :pass, :status, :schedule, :start, :end, :price, :start_time, :end_time, :duration, :period, :desc)
    end
end
