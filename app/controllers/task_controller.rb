class TaskController < ApplicationController

  layout 'dashboard'
  before_action :authenticate_user!

  def add_student
    search = params[:keyword] || ''
    type   = params[:type] || 'student_code'
    @student = Student.search(search,type) # .sort_by { |s| Course.find(s[:course])[:grade]  }
    @course  = Course.find(params[:course])
    @registers = Register.where(course: @course[:id]).pluck(:student)
    @register_lists = Student.where(student_code: @registers)
  end

  def add_student_trigger
    # puts 'get params >>>>>>>>>>'
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
    redirect_to :back
  end

  def add_seat
    search = params[:keyword] || ''
    type   = params[:type] || 'student_code'
    @classroom  = Classroom.find(params[:classroom])
    @course     = Course.find(@classroom[:course])
    registered  = Register.where(course: @course[:id]).pluck(:student)
    @students_in_course = Student.where(student_code: registered).search(search,type)
    @seats      = Seat.where(classroom: @classroom[:id]).pluck(:student)
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
          get_score  = Exam.create(classroom: classname ,student: sc, exam_type: 'scoring')
          get_mental = Exam.create(classroom: classname ,student: sc, exam_type: 'mental')
        else
          puts "[FOUNDED]In Classroom #{sc} .. student was registered"
        end
      end
    end
    redirect_to :back
  end
end
