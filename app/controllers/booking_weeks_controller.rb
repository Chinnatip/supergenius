class BookingWeeksController < ApplicationController
  layout 'dashboard'
  before_action :set_booking_week, only: [:show, :edit, :update, :destroy]

  # GET /booking_weeks
  # GET /booking_weeks.json
  def index
    @booking_weeks = BookingWeek.all
  end

  # GET /booking_weeks/1
  # GET /booking_weeks/1.json
  def show
  end

  # GET /booking_weeks/new
  def new
    @booking_week = BookingWeek.new
  end

  # GET /booking_weeks/1/edit
  def edit
  end

  # POST /booking_weeks
  # POST /booking_weeks.json
  def create
    @booking_week = BookingWeek.new(booking_week_params)

    respond_to do |format|
      if @booking_week.save
        format.html { redirect_to @booking_week, notice: 'Booking week was successfully created.' }
        format.json { render :show, status: :created, location: @booking_week }
      else
        format.html { render :new }
        format.json { render json: @booking_week.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_weeks/1
  # PATCH/PUT /booking_weeks/1.json
  def update
    respond_to do |format|
      if @booking_week.update(booking_week_params)
        format.html { redirect_to @booking_week, notice: 'Booking week was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_week }
      else
        format.html { render :edit }
        format.json { render json: @booking_week.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_weeks/1
  # DELETE /booking_weeks/1.json
  def destroy
    @booking_week.destroy
    respond_to do |format|
      format.html { redirect_to booking_weeks_url, notice: 'Booking week was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_week
      @booking_week = BookingWeek.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_week_params
      params.require(:booking_week).permit(:week, :title)
    end
end
