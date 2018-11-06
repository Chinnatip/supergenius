class ClassroomsController < ApplicationController
  layout 'dashboard'
  before_action :set_classroom, only: [:show, :edit, :update, :destroy] , except: [:class_detail]
  before_action :authenticate_user!
  before_action :check_admin_role

  def parse_maximum_code(course)
    max_session  = Classroom.where(course: course).maximum("spec")[10..11].to_i rescue 0
    return "#{'%02d' % ( max_session + 1)}"
  end

  def detacthed_course_spec(cs)
    course_id = Course.find(cs)[:session_id]
    return "#{course_id}#{parse_maximum_code(cs)}"

    # course = Course.find(cs)
    # grader = ['P1','P2','P3','P4','P5','P6','M1','M2','M3','M4','M5','M6']
    # major   = course[:major].to_s
    # grade   = grader[course[:grade].to_i - 1]
    # current_year = (Time.now.strftime('%Y')[2..3].to_i + 43).to_s
    # runner = Classroom.where(course: course[:id])
    # if runner.count > 0
    #   parser = []
    #   runner.each do |r|
    #     parser << r[:spec][8..9].to_i
    #   end
    #   running = ("%02d" % (parser.max + 1))
    # else
    #   running = '01'
    # end
    #
    # return "#{major}#{current_year}#{grade}#{running}"
  end

  # GET /classrooms
  # GET /classrooms.json
  def index
    # @classrooms = Classroom.all
    search      = params[:keyword] || ''
    type        = params[:type] || 'spec'
    @teacher_collect = @admin_checker[:role] == 'teacher' ? Classroom.find(teacher_parser(@admin_checker[:uid])) : ''
    @teacher_class  = @admin_checker[:role] == 'teacher' ? @teacher_collect.pluck(:id) : ''
    @teacher_course = @admin_checker[:role] == 'teacher' ? @teacher_collect.pluck(:course).uniq : ''
    @classrooms     = Classroom.search(search,type) # .sort_by { |s| Course.find(s[:course])[:grade]  }
    @couse_of_class = @classrooms.pluck(:course)
    @semester_lists = Course.where(id: @couse_of_class).pluck(:semester).uniq
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

  # parse classroom that teacher was teached
  def teacher_parser(id)
    result = []
    Classroom.all.each do |cs|
      teacher = cs[:teacher].split(",")
      puts teacher.to_json
      puts
      unless teacher.index(id.to_s).nil?
        result << cs[:id]
      end
    end
    puts result.to_json
    return result
  end

  def class_detail
    get_sort_offer
    @classroom = Classroom.find(params[:id])
    @seats     = Seat.where(classroom: params[:id])
    @select_options = ["","-","0","1","2","3","4","5","6","7","8","9","10"]
    course_period   = Course.find(@classroom[:course])[:period]
    @toggle_max_score = JSON.parse(@classroom[:max_score]) rescue nil
    @max_score      = (@toggle_max_score.sort_by { |k,v| k.to_f }).to_h rescue sampling_score(Array.new( course_period , 10))
    @current_period = Classroom.find(params[:id])[:current] || "1"
    @seat_sort      = sortable_seat(@seats, params[:sort])
    puts "debug crasher >>"
  end

  def sortable_seat(seat,sort_param)
    if sort_param == 'total_score'
      return seat.sort_by{ |s| find_score(@classroom.id, s[:student]).values.map { |m| m.to_i rescue 0 }.reduce(:+) }.reverse
    elsif sort_param == 'current_score'
      return seat.sort_by{ |s| find_score(@classroom.id, s[:student])[@current_period].to_i rescue 0 }.reverse
    else
      return seat.sort_by{ |s| s[:student] }.sort_by { |s| s[:comment].to_s }
    end
  end

  def find_score(classroom,student)
    exam  = Exam.where(classroom: classroom , student: student ,exam_type: 'scoring').first
    score = exam['score'] rescue "{\"0\":\"0\"}"
    return JSON.parse(score)
  end

  def sampling_score(array)
    result = {}
    array.each_with_index do |val,i|
      key = (i + 1).to_s
      result[key] = val.to_s
    end
    puts "res >>>"
    puts result
    puts result.to_json
    return result
  end

  # POST /classrooms
  # POST /classrooms.json
  def create
    @classroom = Classroom.new(classroom_params)
    @classroom[:spec] = detacthed_course_spec(params[:classroom][:course])
    @classroom[:teacher] = params[:classroom][:teacher].join(",")
    puts params[:inspect]
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
    puts params[:inspect]
    @classroom[:teacher] = params[:classroom][:teacher].join(",")
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
      params.require(:classroom).permit(:name, :spec, :course, :teacher, :seat, :booked, :pass, :status, :schedule, :start, :end, :price, :start_time, :end_time, :duration, :period, :desc, :max_score)
    end

    def check_admin_role
      admin = current_user[:role]
      if admin == "teacher"
        teacher_id = current_user[:uid][1..2].to_i
      end
      @admin_checker = {
        role: admin ,
        uid:  teacher_id || ""
      }
      @is_admin = current_user[:role] == "admin" ? true : false
    end

    def get_sort_offer
      @sort_items = [
        {t: 'รหัสนักเรียน',        v: 'code' },
        {t: 'คะเเนนสอบรวม',     v: 'total_score' },
        {t: 'คะเเนนสอบครั้งปัจุบัน', v: 'current_score' },
      ]
    end
end
