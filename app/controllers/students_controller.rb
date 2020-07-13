require 'rest-client'

class StudentsController < ApplicationController

  layout 'dashboard'

  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /students
  # GET /students.json
  def index
    if params[:substitude].present?
      @students = Student.where(substitude: true)
      @substitude = params[:substitude]
    elsif params[:projected_school].present?
      @students = Student.where(school: params[:projected_school] , grade: params[:projected_grade], substitude: false)
    else
      search = params[:keyword] || ''
      type   = params[:type] || 'student_code'
      @students = Student.search(search,type) # .sort_by { |s| Course.find(s[:course])[:grade]  }
    end
    @grade_lists = @students.pluck(:grade).uniq.sort { |x,y| x <=> y }
    @student_count = @students.count
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    # puts "111"
    # student_grade = @student.grade
    # case student_grade
    # when 1..6
    #     @student.school_primary = @student.school
    #     puts @student.school_primary
    #   when 7..12
    #     @student.school_secondary = @student.school
    #     puts @student.school_secondary
    #   when 13
    #     @student.school_university = @student.school
    #     puts @student.school_university
    # end
    #
    # puts "get school >"
    # puts student_grade
  end

  def decode_student_year(grade)
    buddhist_era_factor = 43
    total_collage_year  = 13
    @current_year_formatted = Config.first.current_year - 2543
    current_year_in_ad  = @current_year_formatted || Time.now.strftime('%Y')[2..3].to_i
    decode_year         = current_year_in_ad + buddhist_era_factor + total_collage_year
    return ("%02d" % (decode_year - grade.to_i)).to_s
  end

  def decode_student_runner(grade)
    parser = []
    grade_count = Student.where(grade: grade).maximum("student_code")[2..4].to_i rescue 0
    return ("%03d" % (grade_count + 1)).to_s # rescue "001"
  end

  def detatched_student_code(check_substitude, grade)
    if check_substitude == 'true'
      filter = Student.where(substitude: true)
      if filter.count > 0
        codex = filter.last.student_code.to_i + 1
      else
        codex = '50001'
      end
      return codex
    else
      grader  = decode_student_year(grade)
      counter = decode_student_runner(grade)
      return "#{grader}#{counter}"
    end

  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    @student[:student_code] = detatched_student_code(params[:student][:substitude], params[:student][:grade])
    @student[:secret_id] = Random.new.rand(100_000..1_000_000).to_s

    # puts detatched_student_code(params[:student][:substitude], params[:student][:grade])
    generate_password = Student.parse_birthdate(@student[:birthday])

    # ODM Send http POST REQUEST
    begin
      odm_url_path   = "http://test.odm-supergenius.com"
      odm_api_key    = "a38efe18372abea876c7d60ca22f0e4db47c37bbcc103d1f"
      url            = "#{odm_url_path}/hook/api/members/"

      trick_name = if @student[:name] != '' then @student[:name] else "ชื่อจริง" end
      trick_surname = if @student[:surname] != '' then @student[:surname] else "นามสกุล" end
      payload =  {
        "username": @student[:student_code],
        "password": generate_password,
        "first_name": trick_name,
        "last_name": trick_surname,
        "nick_name": @student[:nickname]
      }
      puts payload
      request_header = { 'Content-Type': 'application/json' , 'x-api-key': "a38efe18372abea876c7d60ca22f0e4db47c37bbcc103d1f" }
      http_response  = RestClient.post(url, payload, headers=request_header)
      parse_response = JSON.parse(http_response.body)
      puts "finished"
      @student[:odm_member_id] = parse_response['id']
    rescue
      puts "[Connection error]::Some error occurred while create student in ODM-API"
    end

    respond_to do |format|
      if @student.save
        format.html { redirect_to students_url, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    # check student code when update
    if @student.grade.to_s != params['student']['grade'].to_s
      new_student_code = detatched_student_code(params['student']['grade'])
      @student[:student_code] = new_student_code
    end
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to students_url, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    odm_id    = @student[:odm_member_id]
    check_odm = odm_id.is_a? Integer
    if odm_id != 0
      if odm_id.is_a? Integer
        puts "delete ODM member"

        # ODM Send http POST REQUEST
        begin
          odm_url_path   = "http://test.odm-supergenius.com"
          odm_api_key    = "a38efe18372abea876c7d60ca22f0e4db47c37bbcc103d1f"
          url            = "#{odm_url_path}/hook/api/members/#{odm_id}/"
          payload =  {
            "first_name": @student[:name]
          }
          request_header = { 'Content-Type': 'application/json' , 'x-api-key': "a38efe18372abea876c7d60ca22f0e4db47c37bbcc103d1f" }
          http_response  = RestClient.delete(url, headers=request_header)
          parse_response = JSON.parse(http_response.body)
          puts http_response
          puts "delete finished"
        rescue
          puts 'Some error occurred while DELETE request'
        end

      end
    end
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
      # puts params[:id]
      # @student = Student.where(student_code: params[:id].to_s).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(
        :name, :surname, :grade,
        :school, :school_primary, :school_secondary, :school_university,
        :parent, :email, :tel, :line, :facebook,
        :nickname, :username ,:password ,
        :secret_id, :gender, :tel_parent, :birthday, :school_program, :substitude
      )
    end
end
