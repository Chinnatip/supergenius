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

  def get_class_advisee
    parser = []
    seats = Seat.where(classroom: params[:classroom])
    seats.each do |s|
      parser << s[:student]
    end
    result = {
      get: "นักเรียนลงทะเบียนทั้งหมด #{parser.count}คน",
      collect: parser
    }
    render json: result
  end

  def parse_type(type)
    if type == 'extra'
      return "นัดเพิ่ม"
    else
      return "นัดเเก้"
    end
  end

  def get_addcourse_note
    res    = Addcourse.where(course: params[:course] ,add_type: params[:type]).first
    result = {
      course: Course.where(session_id: res[:course]).first[:name] ,
      type:   parse_type(res[:add_type]),
      note:   res[:desc] ,
      edit_inject: "/addcourses/#{res[:id]}/edit"
    }
    render json: result
  end

  def get_comment_req
    res = Comment.where(
      classroom: params[:classroom],
      period: params[:period],
      student: params[:student]).first
    puts "res >>>"
    puts res[:comment]
    render json: res
  end

  def get_seat_comment_req
    res = Seat.find(params[:id])
    render json: res
  end

end
