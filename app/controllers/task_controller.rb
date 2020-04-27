require 'rest-client'

class TaskController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!

  def add_student
    search = params[:keyword] || ''
    type   = params[:type] || 'student_code'
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
          begin
            get_course = Course.find(params[:course])
            get_student = Student.where(student_code: sc).last
            if !get_course.odm_key.nil? & !get_student.odm_member_id.nil?
              # Preparing
              odm_url_path   = "http://test.odm-supergenius.com"
              odm_api_key    = "a38efe18372abea876c7d60ca22f0e4db47c37bbcc103d1f"
              course_key     = get_course.odm_key
              member_id      = get_student.odm_member_id
              url            = "#{odm_url_path}/hook/api/members/#{member_id}/courses/#{course_key}/"
              request_header = { 'Content-Type': 'application/json' , 'x-api-key': odm_api_key }
              http_response  = RestClient.post(url, {}.to_json, headers=request_header)
              parse_response = JSON.parse(http_response.body)
              puts "finished"
            else
              puts 'ODM member id NIL!!!'
            end
          rescue StandardError => e
            puts e.message
            puts 'Some error occurred while POST request'
          end
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
      selected_student.each do |sc|
        check_student_in_class = Seat.where(classroom: classname ,student: sc).first
        unless check_student_in_class
          puts "[NOT FOUNDED]Created new seat for #{sc} in class [#{classname}].."
          seats = Seat.create(classroom: classname ,student: sc, status: "added")
        else
          puts "[FOUNDED]In Classroom #{sc} .. student was registered"
        end
      end
    end
    # TEST Redirect back
    redirect_back(fallback_location: root_path)
  end

  def remove_student_from_course
    get_student = Student.find(params[:student])
    student_code = get_student[:student_code]
    Register.where(course: params[:id],student: student_code).first.destroy
    begin
      get_course = Course.find(params[:id])
      if !get_course.odm_key.nil? & !get_student.odm_member_id.nil?
        # Preparing
        odm_url_path   = "http://test.odm-supergenius.com"
        odm_api_key    = "a38efe18372abea876c7d60ca22f0e4db47c37bbcc103d1f"
        course_key     = get_course.odm_key
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

  def remove_student_from_class
    Seat.where(classroom: params[:id] , student: params[:student] ).first.destroy
    # TEST Redirect back
    redirect_back(fallback_location: root_path)
  end
end
