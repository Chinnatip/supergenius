class KidController < ApplicationController
  layout "report"
  before_action :authenticate_user!, only: [:show]

  # inject qrcode generator
  require 'rqrcode'
  require 'chunky_png'

  def show
    result = []
    kid   = Student.where(student_code: params[:id]).first
    @kid = {
      name:   kid[:nickname] ,
      id:     params[:id],
      grade:  Student.parse_grade(kid[:grade]),
      school: Student.parse_school(kid[:school])
    }
    seats = Seat.where(student: params[:id])
    seats.each do |st|
    result << {
      student:   st[:student] ,
      classroom: st[:classroom],
      comment: st[:comment]
    }
    end
    @result = result
    # get QR code
    @qr = RQRCode::QRCode.new( 'https://github.com/whomwah/rqrcode', :size => 4, :level => :h )
  end

  def index
    result = []
    kid = Student.all
    kid.each do |k|
      result << {
        name:   k[:nickname] ,
        id:     k[:student_code],
        grade:  Student.parse_grade(k[:grade]),
        school: Student.parse_school(k[:school])
      }
    end
    @kid = result
  end

  def feedback
    student = Student.where( student_code: params[:student_id] ).first
    @feedback = {
      id:      student[:id],
      name:    student[:nickname],
      code:    student[:student_code],
      profile: params[:profile],
      scoring: params[:scoring],
      mental:  params[:mental] ,
      school_feedback: params[:school_feedback]
    }
    puts @feedback

    # sending feedback email to admin
    mailto = 'chin@kohlife.com'
    UserMailer.feedback_email(@feedback , mailto).deliver_now

    # redirect to student page
    redirect_to :back
  end
end
