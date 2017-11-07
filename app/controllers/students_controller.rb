class StudentsController < ApplicationController

  layout 'dashboard'

  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /students
  # GET /students.json
  def index
    # @students = Student.all
    search = params[:keyword] || ''
    type   = params[:type] || 'student_code'
    @students = Student.search(search,type) # .sort_by { |s| Course.find(s[:course])[:grade]  }
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
  end

  def decode_student_year(grade)
    buddhist_era_factor = 43
    total_collage_year  = 13
    current_year_in_ad  = Time.now.strftime('%Y')[2..3].to_i
    decode_year         = current_year_in_ad + buddhist_era_factor + total_collage_year
    return ("%02d" % (decode_year - grade.to_i)).to_s
  end

  def decode_student_runner(grade)
    parser = []
    grade_count = Student.where(grade: grade).maximum("student_code")[2..4].to_i rescue 0
    return ("%03d" % (grade_count + 1)).to_s # rescue "001"

  end

  def detatched_student_code(grade)
    grader  = decode_student_year(grade)
    counter = decode_student_runner(grade)
    return "#{grader}#{counter}"
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    @student[:student_code] = detatched_student_code(params[:student][:grade])
    @student[:secret_id] = Random.new.rand(100_000..1_000_000).to_s

    puts "show detached code >>>"
    puts detatched_student_code(params[:student][:grade])
    puts params[:student][:nickname]
    puts "finished"

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
     if @student.grade != params['student']['grade']
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
      params.require(:student).permit(:name, :surname, :grade, :school, :parent, :email, :tel, :line, :facebook, :nickname, :username ,:password ,:secret_id, :gender, :tel_parent, :birthday)
    end
end
