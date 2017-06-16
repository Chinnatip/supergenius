class InitController < ApplicationController
  def get_subscription
    parser = []
    seats = Seat.where(student: params[:student_code])
    seats.each do |s|
      parser << s[:classroom]
    end
    result = {
      get: "ได้ลงทะเบียนในคอร์ส #{parser}",
      collect: parser
    }
    render json: result
  end
end
