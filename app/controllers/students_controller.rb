class StudentsController < ApplicationController

  layout 'dashboard'

  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
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
    inspector = Time.now.strftime('%Y')[2..3].to_i + 56
    return ("%02d" % (inspector - grade.to_i)).to_s
  end

  def decode_student_runner(grade)
    parser = []
    all = Student.where(grade: grade)

    all.each do |s|
      parser << s[:student_code][3..4].to_i
    end
    return ("%03d" % (parser.max + 1)).to_s

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
      params.require(:student).permit(:name, :surname, :grade, :school, :parent, :email, :tel, :line, :facebook, :nickname, :username ,:password ,:secret_id)
    end
end
