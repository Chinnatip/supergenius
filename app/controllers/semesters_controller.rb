class SemestersController < ApplicationController
  layout 'dashboard'

  before_action :set_semester, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /semesters
  # GET /semesters.json
  def index
    @semesters = Semester.all
    @year_lists = Semester.pluck(:year).uniq.sort { |x,y| y <=> x }
  end

  # GET /semesters/1
  # GET /semesters/1.json
  def show
  end

  # GET /semesters/new
  def new
    @semester = Semester.new
  end

  # GET /semesters/1/edit
  def edit
  end

  def sem_code_gen(year,index)
    sem_digit = format('%02d', index.to_i)
    result  = "#{year}#{sem_digit}"
    return result
  end

  # POST /semesters
  # POST /semesters.json
  def create
    @semester = Semester.new(semester_params)
    @semester[:sem_code] = sem_code_gen(@semester[:year],@semester[:sem_index])
    respond_to do |format|
      if @semester.save
        format.html { redirect_to @semester, notice: 'Semester was successfully created.' }
        format.json { render :show, status: :created, location: @semester }
      else
        format.html { render :new }
        format.json { render json: @semester.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /semesters/1
  # PATCH/PUT /semesters/1.json
  def update
    @semester[:sem_code] = sem_code_gen( params[:semester][:year] , params[:semester][:sem_index] )
    respond_to do |format|
      if @semester.update(semester_params)
        format.html { redirect_to @semester, notice: 'Semester was successfully updated.' }
        format.json { render :show, status: :ok, location: @semester }
      else
        format.html { render :edit }
        format.json { render json: @semester.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /semesters/1
  # DELETE /semesters/1.json
  def destroy
    @semester.destroy
    respond_to do |format|
      format.html { redirect_to semesters_url, notice: 'Semester was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_semester
      @semester = Semester.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def semester_params
      params.require(:semester).permit(:name, :year, :description, :course_count, :sem_code, :sem_index)
    end
end
