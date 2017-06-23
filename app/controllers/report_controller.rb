class ReportController < ApplicationController
  layout "report"

  def show
    result = []
    @classroom = Classroom.where(spec: params[:id]).first
    seats = Seat.where(classroom: params[:id])
    seats.each do |st|
      student = Student.where(student_code: st[:student]).first
      result << {
        classroom: params[:id] ,
        student_name: student[:nickname],
        student: student[:student_code],
        grade:   Student.parse_grade(student[:grade]),
        school:  Student.parse_school(student[:school]),
        comment: st[:comment]
      }
    end
    @result = result
  end

  def index
    rooms = Classroom.all
    grader = [
      {key: 'P1', classroom: [] , val: 'ประถมศึกษาปีที่ 1'},
      {key: 'P2', classroom: [] , val: 'ประถมศึกษาปีที่ 2'},
      {key: 'P3', classroom: [] , val: 'ประถมศึกษาปีที่ 3'},
      {key: 'P4', classroom: [] , val: 'ประถมศึกษาปีที่ 4'},
      {key: 'P5', classroom: [] , val: 'ประถมศึกษาปีที่ 5'},
      {key: 'P6', classroom: [] , val: 'ประถมศึกษาปีที่ 6'},
      {key: 'M1', classroom: [] , val: 'มัธยมศึกษาปีที่ 1'},
      {key: 'M2', classroom: [] , val: 'มัธยมศึกษาปีที่ 2'},
      {key: 'M3', classroom: [] , val: 'มัธยมศึกษาปีที่ 3'},
      {key: 'M4', classroom: [] , val: 'มัธยมศึกษาปีที่ 4'},
      {key: 'M5', classroom: [] , val: 'มัธยมศึกษาปีที่ 5'},
      {key: 'M6', classroom: [] , val: 'มัธยมศึกษาปีที่ 6'}
    ]
    grader.each_with_index do |g,i|
      rooms.each do |r|
        if r[:spec][5..6] == g[:key]
          g[:classroom] << {
            spec: r[:spec],
            name: r[:name] ,
            student: Classroom.parse_seat(r[:spec]) ,
            teacher: Classroom.parse_teacher(r[:teacher]) ,
            period: r[:period]
          }
        end
      end
    end
    @class_index = grader
  end
end
