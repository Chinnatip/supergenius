class SchoolProgramsController < ApplicationController

  layout 'dashboard'

  before_action :set_school_program, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /school_programs
  # GET /school_programs.json
  def index
    @school_programs = SchoolProgram.all
  end

  # GET /school_programs/1
  # GET /school_programs/1.json
  def show
  end

  # GET /school_programs/new
  def new
    @school_program = SchoolProgram.new
  end

  # GET /school_programs/1/edit
  def edit
  end

  # POST /school_programs
  # POST /school_programs.json
  def create
    @school_program = SchoolProgram.new(school_program_params)
    @school_program[:code] = Random.new.rand(10000..100000).to_s

    respond_to do |format|
      if @school_program.save
        format.html { redirect_to @school_program, notice: 'School program was successfully created.' }
        format.json { render :show, status: :created, location: @school_program }
      else
        format.html { render :new }
        format.json { render json: @school_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_programs/1
  # PATCH/PUT /school_programs/1.json
  def update
    respond_to do |format|
      if @school_program.update(school_program_params)
        format.html { redirect_to @school_program, notice: 'School program was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_program }
      else
        format.html { render :edit }
        format.json { render json: @school_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_programs/1
  # DELETE /school_programs/1.json
  def destroy
    @school_program.destroy
    respond_to do |format|
      format.html { redirect_to school_programs_url, notice: 'School program was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_program
      @school_program = SchoolProgram.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def school_program_params
      params.require(:school_program).permit(:name, :code, :content)
    end
end
