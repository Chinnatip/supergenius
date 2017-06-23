class KidController < ApplicationController
  layout "report"
  before_action :authenticate_user!, only: [:show]

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
end
