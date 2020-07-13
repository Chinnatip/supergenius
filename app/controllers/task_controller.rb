require 'rest-client'

class TaskController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!

  def add_student
    search = params[:keyword] || ''
    type   = params[:type] || 'student_code'
    substitude = params[:substitution]
     # .sort_by { |s| Course.find(s[:course])[:grade]  }
    @course  = Course.find(params[:course])
    @registers = Register.where(course: @course[:id]).pluck(:student)
    @student = Student.search(search,type).where.not(student_code: @registers)
    @register_lists = Student.where(student_code: @registers)
  end

  def add_student_trigger
    if params[:student].present?
      selected_student = params[:student].keys
      selected_student.each do |sc|
        check_student_in_register = Register.where(course: params[:course],student: sc).first
        unless check_student_in_register
          puts "[NOT FOUNDED]Created new registered for #{sc} in course [#{params[:course]}].."
          Register.create!(course: params[:course] ,student: sc , status: "added"  )
        else
          puts "[FOUNDED]In Classroom #{params[:classroom]} .. student was registered"
        end
      end
    end
    # TEST Redirect back
    redirect_back(fallback_location: root_path)
  end

  def add_seat
    search = params[:keyword] || ''
    type   = params[:type] || 'student_code'
    @classroom  = Classroom.find(params[:classroom])
    @course     = Course.find(@classroom[:course])
    registered  = Register.where(course: @course[:id]).pluck(:student)
    @seats      = Seat.where(classroom: @classroom[:id]).pluck(:student)
    @students_in_course = Student.where(student_code: registered).search(search,type).where.not(student_code: @seats)
    @seat_lists = Student.where(student_code: @seats)
  end

  def add_seat_trigger
    if params[:student].present?
      classname = params[:classroom]
      selected_student = params[:student].keys
      #
      selected_student.each do |sc|
        check_student_in_class = Seat.where(classroom: classname ,student: sc).first
        unless check_student_in_class
          puts "[NOT FOUNDED]Created new seat for #{sc} in class [#{classname}].."
          seats = Seat.create(classroom: classname ,student: sc, status: "added")
        else
          puts "[FOUNDED]In Classroom #{sc} .. student was registered"
        end
      end

      begin
        get_classroom = Classroom.find(params[:classroom])
        get_students_member_id = Student.where(student_code: selected_student).pluck(:odm_member_id).compact
        # Preparing
        odm_url_path   = "https://www.odm-supergenius.com" #"http://test.odm-supergenius.com"
        odm_api_key    = "c905cef198842013c572dbff363ac8d467b5a93a18e840a7" #"389e3fcfafc84b69fbad3b393cdc46ba9aa10bf7ae882b73"

        course_key     = get_classroom.spec
        url            = "#{odm_url_path}/hook/api/courses/#{course_key}/members/"
        # url            = "#{odm_url_path}/hook/api/members/#{member_id}/courses/#{course_key}/"
        request_header = { 'Content-Type': 'application/json' , 'x-api-key': odm_api_key }
        http_response  = RestClient.post(url, { 'member_list': get_students_member_id }.to_json, headers=request_header)
        parse_response = JSON.parse(http_response.body)
        puts "finished"

      rescue StandardError => e
        puts e.message
        puts 'Some error occurred while POST request'
      end
    end
    # TEST Redirect back
    redirect_back(fallback_location: root_path)
  end

  def remove_student_from_course
    get_student = Student.find(params[:student])
    student_code = get_student[:student_code]
    Register.where(course: params[:id],student: student_code).first.destroy
    # TEST Redirect back
    redirect_back(fallback_location: root_path)
  end

  def remove_student_from_class
    seat = Seat.where(classroom: params[:id] , student: params[:student] ).first
    classroom_id = seat.classroom
    seat.destroy
    #
    begin
      get_classroom = Classroom.find(classroom_id.to_i)
      get_student = Student.where(student_code: params[:student]).first
      if !get_student.odm_member_id.nil?
        # Preparing
        odm_url_path   = "https://www.odm-supergenius.com" #"http://test.odm-supergenius.com"
        odm_api_key    = "c905cef198842013c572dbff363ac8d467b5a93a18e840a7" #"389e3fcfafc84b69fbad3b393cdc46ba9aa10bf7ae882b73"
        course_key     = get_classroom.spec
        member_id      = get_student.odm_member_id
        url            = "#{odm_url_path}/hook/api/members/#{member_id}/courses/#{course_key}/"
        request_header = { 'Content-Type': 'application/json' , 'x-api-key': odm_api_key }
        http_response  = RestClient.delete(url, headers=request_header)
        parse_response = JSON.parse(http_response.body)
        puts "delete finished"
      else
        puts 'ODM member id NIL!!!'
      end
    rescue
      puts 'Some error occurred while DELETE request'
    end
    # TEST Redirect back
    redirect_back(fallback_location: root_path)
  end
end
