class HomeController < ApplicationController

  require 'json'
  require 'open-uri'
  require 'nokogiri'
  require 'uri'
  require_relative 'scrap'

  def celebrity
    render :layout => 'standalone'
  end

  def index
    # first time rendering
    # unless session[:visited] == true
    #   redirect_to home_introduce_path
    # end
    @active = 'index'
    @content = Cm.where(tagid: "home").first
  end

  def introduce
    session[:visited] = true
  end

  def course
    @content = Cm.where(tagid: "course").first
  end

  def help
  end

  def news
    # @news = Newsfeed.all
    @news = Newsfeed.where(status: 'publish')
  end

  def news_detail
    @detail = Newsfeed.find(params[:id])
    if @detail[:viewer].present?
      @detail[:viewer] += 1
    else
      @detail[:viewer] = 0
    end
    @detail.save
  end

  def edit_current
    cs = Classroom.find(params[:class])
    cs[:current] = params[:current]
    cs.save
    redirect_to "/class_detail?id=#{params[:class]}"
  end

  def about
    @content = Cm.where(tagid: "about").first
  end

  def student
    @content = Cm.where(tagid: "student").first
  end

  def tutor
    @content = Cm.where(tagid: "tutor").first
  end

  def top_student
    @content = Cm.where(tagid: "top_student").first
  end

  def contact
    @content = Cm.where(tagid: "contact").first
  end

  def portfolio
    @filter = params[:filtered]
  end

  def update_class
    # puts 'get params >>>>>>>>>>'
    # puts params[:student]
    selected_student = params[:student].keys
    selected_student.each do |sc|
      check_student_in_class = Seat.where(classroom: params[:classroom] ,student: sc).first
      unless check_student_in_class
        puts "[NOT FOUNDED]Created new seat for #{sc} in classroom [#{params[:classroom]}].."
        seats = Seat.create(classroom: params[:classroom] ,student: sc  )
        get_score  = Exam.create(classroom: params[:classroom] ,student: sc  , exam_type: 'scoring')
        get_mental = Exam.create(classroom: params[:classroom] ,student: sc  , exam_type: 'mental')
      else
        puts "[FOUNDED]In Classroom #{params[:classroom]} .. student was registered"
      end
    end
    redirect_to :back
  end

  def update_addcourse
  end

  def update_course
    # puts 'get params >>>>>>>>>>'
    # puts params[:student]
    selected_course = params[:course].keys
    selected_course.each do |sc|
      check_student_in_class = Seat.where(classroom: sc ,student: params[:student]).first
      unless check_student_in_class
        puts "[NOT FOUNDED]Created new seat for #{params[:student]} in classroom [#{sc}].."
        seats = Seat.create(classroom: sc ,student: params[:student])
        get_score  = Exam.create(classroom: sc ,student: params[:student], exam_type: 'scoring')
        get_mental = Exam.create(classroom: sc ,student: params[:student], exam_type: 'mental')
      else
        puts "[FOUNDED]In Classroom #{sc} .. student was registered"
      end
    end
    redirect_to :back
  end

  def update_score
    puts "get update score >>>"
    # puts params.inspect
    # puts params[:s].keys
    #
    classroom = Classroom.find(params[:cl])
    classroom[:max_score] = params[:max].to_json
    classroom.save
    #
    student_seats = params[:s].keys
    student_seats.each do |student|
      student_code = Student.find(student)[:student_code]
      score_param  = {classroom: params[:cl], student: student_code ,exam_type: 'scoring'}
      mental_param  = {classroom: params[:cl], student: student_code ,exam_type: 'mental'}
      # update score point
      if Exam.where(score_param).count == 0
        puts "created news grade score for #{student_code}>>>"
        score_init = Exam.create!(score_param)
        score_init[:score] = params[:s]["#{student}"].to_json
        score_init.save
      else
        puts "found grade for #{student_code}>>>"
        #
        current    = params[:s][student].keys[0]
        current_score = params[:s][student][current]
        #
        score_init  = Exam.where(score_param).first
        clone_score = JSON.parse(score_init[:score])
        clone_score[current]  = current_score
        score_init[:score] = clone_score.to_json
        #
        score_init.save
      end

      # update mental point
      if Exam.where(mental_param).count == 0
        puts "created news grade mental for #{student_code}>>>"
        mental_init = Exam.create!(mental_param)
        mental_init[:score] = params[:m]["#{student}"].to_json
        mental_init.save
      else
        puts "found grade mental for #{student_code}>>>"
        #
        current        = params[:m][student].keys[0]
        current_mental = params[:m][student][current]
        #
        mental_init  = Exam.where(mental_param).first
        clone_mental = JSON.parse(mental_init[:score])
        clone_mental[current]  = current_mental
        mental_init[:score] = clone_mental.to_json
        #
        mental_init.save
      end
    end
    #
    redirect_to :back
  end

  def reddit
    @posts = [
      {
        vote: 12,
        title: 'megan fox'
      },{
        vote: 120,
        title: 'femininegirls'
      },{
        vote: 47,
        title: 'superman in the sky'
      },
    ]
  end
end
