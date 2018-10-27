class BookingReasonsController < ApplicationController
  layout 'dashboard'
  before_action :set_booking_reason, only: [:show, :edit, :update, :destroy]

  # GET /booking_reasons
  # GET /booking_reasons.json
  def index
    @booking_reasons = BookingReason.all
  end

  # GET /booking_reasons/1
  # GET /booking_reasons/1.json
  def show
  end

  # GET /booking_reasons/new
  def new
    @booking_reason = BookingReason.new
  end

  # GET /booking_reasons/1/edit
  def edit
  end

  # POST /booking_reasons
  # POST /booking_reasons.json
  def create
    @booking_reason = BookingReason.new(booking_reason_params)

    respond_to do |format|
      if @booking_reason.save
        format.html { redirect_to @booking_reason, notice: 'Booking reason was successfully created.' }
        format.json { render :show, status: :created, location: @booking_reason }
      else
        format.html { render :new }
        format.json { render json: @booking_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_reasons/1
  # PATCH/PUT /booking_reasons/1.json
  def update
    respond_to do |format|
      if @booking_reason.update(booking_reason_params)
        format.html { redirect_to @booking_reason, notice: 'Booking reason was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_reason }
      else
        format.html { render :edit }
        format.json { render json: @booking_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_reasons/1
  # DELETE /booking_reasons/1.json
  def destroy
    @booking_reason.destroy
    respond_to do |format|
      format.html { redirect_to booking_reasons_url, notice: 'Booking reason was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_reason
      @booking_reason = BookingReason.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_reason_params
      params.require(:booking_reason).permit(:reason, :ref_code)
    end
end
