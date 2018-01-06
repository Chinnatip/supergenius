class ReportController < ApplicationController
  layout "report"
  # layout 'dashboard'
  before_action :get_year_lists

  def show
    result = []
    @classroom = Classroom.find(params[:id])
    @classroom_detail = Classroom.details(@classroom)
    @seats          = Seat.where(classroom: params[:id])
    @seat_sort      = sortable_seat(@seats, 'total_score')
    @select_options = ["","-","0","1","2","3","4","5","6","7","8","9","10"]
    course_period   = Course.find(@classroom.course).period
    @toggle_max_score = JSON.parse(@classroom[:max_score]) rescue nil
    @max_score      = (@toggle_max_score.sort_by { |k,v| k.to_f }).to_h rescue  sampling_score(Array.new( course_period , 10))
    @current_period = Classroom.find(params[:id])[:current] || "1"
  end

  def sortable_seat(seat,sort_param)
    if sort_param == 'total_score'
      return seat.sort_by{ |s| find_score(@classroom.id, s[:student]).values.map { |m| m.to_i rescue 0 }.reduce(:+) }.reverse
    elsif sort_param == 'current_score'
      return seat.sort_by{ |s| find_score(@classroom.id, s[:student])[@current_period].to_i rescue 0 }.reverse
    else
      return seat.sort_by{ |s| s[:student] }.sort_by { |s| s[:comment].to_s }
    end
  end

  def find_score(classroom,student)
    exam  = Exam.where(classroom: classroom , student: student ,exam_type: 'scoring').first
    score = exam['score'] rescue "{\"0\":\"0\"}"
    return JSON.parse(score)
  end

  def sampling_score(array)
    result = {}
    array.each_with_index do |val,i|
      key = (i + 1).to_s
      result[key] = val.to_s
    end
    puts "res >>>"
    puts result
    puts result.to_json
    return result
  end

  def index
    valid_semester  = Course.pluck(:semester)
    @semester_lists = Semester.where(year: @current_year.to_s , sem_code: valid_semester)
    @courses = Course.all
    @classrooms = Classroom.all
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
            old_link: r[:old_link] ,
            student: Classroom.parse_seat(r[:spec]) ,
            teacher: Classroom.parse_teacher(r[:teacher]) ,
            period: r[:period]
          }
        end
      end
    end
    @class_index = grader
  end

  private
  def get_year_lists
    @year_lists = Semester.pluck(:year).uniq.sort { |x,y| y <=> x }
    @current_year = params[:select_year] || @set_current_year #2560 #DateTime.now.strftime('%Y').to_i + 543
  end
end
