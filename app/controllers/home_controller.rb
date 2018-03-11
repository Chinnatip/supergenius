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

  def set_year
    if params[:current_year].present?
      configs = Config.first
      configs.current_year = params[:current_year]
      configs.save
    end
    redirect_to :back
  end

  def set_semester
    if params[:current_semester].present?
      configs = Config.first
      configs.current_semester = params[:current_semester]
      configs.save
    end
    redirect_to :back
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

  def student_upgrade_grade
    exclude = []
    Student.all.order(:created_at).each do |st|
      if exclude.find_index(st.student_code.to_i).nil?
          grade  = st.grade.to_i
          puts "Current grade of #{st.name}: #{st.student_code} is [#{grade}]"
          shifted_grade = if grade < 12 then grade + 1 else 13 end
          st.grade = shifted_grade
          puts "Shifted to grade [#{shifted_grade}]"
          puts
          st.save
      end
    end
    redirect_to :back
  end

  def remove_period
    puts "period >>>"
    cs    = Classroom.find(params[:class])
    puts cs.to_json
    puts cs[:max_score]
    score = JSON.parse(cs[:max_score])

    # puts score.without(params[:period].to_s)
    cs[:max_score] = score.without(params[:period].to_s).to_json
    cs.save
    redirect_to :back
  end

  def edit_current
    cs = Classroom.find(params[:class])
    cs[:current] = params[:current].to_s
    cs.save
    redirect_to "/class_detail?id=#{params[:class]}&sort=current_score"
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
    puts params.inspect
    puts params[:s].keys
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

  def add_seat_comment
    puts "putput >>>"
    seat = Seat.find(params[:seatid])
    puts seat.to_json
    seat[:comment] = params[:comment]
    seat.save
    redirect_to :back
  end

  def add_comment
    comment_param = {
      classroom: params[:classroom],
      period: params[:period],
      student: params[:student]
    }
    unless Comment.where(comment_param).count > 0
      log = Comment.create!(comment_param)
    else
      log = Comment.where(comment_param).first
    end
    log[:comment] = params[:comment]
    log.save
    redirect_to :back
  end

  def add_table
    puts "addedd table >>"
    puts params.inspect
    classroom     = Classroom.find(params[:id])
    old_max_score = JSON.parse(classroom[:max_score])
    puts classroom[:max_score]
    old_max_score[params[:added].to_s] = "10"
    classroom[:max_score] = old_max_score.to_json
    puts classroom[:max_score]
    classroom.save
    puts "end >>>"

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
