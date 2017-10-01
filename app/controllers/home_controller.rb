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
    # @quote  = 'PSH'
    # @stock_data = parse_set(@quote)[0]
  end

  def introduce
    session[:visited] = true
  end

  def course
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
    # puts params[:current]
    # puts params[:spec]
    cs = Classroom.where(spec: params[:spec]).first
    cs[:current] = params[:current]
    cs.save
    redirect_to "/class_detail?id=#{params[:spec]}"
  end

  def about
  end

  def student
  end

  def tutor
  end

  def top_student
  end

  def contact
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
    # puts "updated data >>>"
    seat = Seat.find(params[:seat_id])
    seat[:comment] = params[:comment]
    seat.save

    score = Exam.where(classroom: params[:classroom],student: params[:student], exam_type: 'scoring').first
    mental = Exam.where(classroom: params[:classroom],student: params[:student], exam_type: 'mental').first
    stock_score = ''
    stock_mental = ''
    #
    params[:score].each do |key,array|
      stock_score += "#{if stock_score.present? then ',' end}#{array.to_s}"
    end
    #
    params[:mental].each do |key,array|
      stock_mental += ",#{array.to_s}"
    end
    #
    score[:score]  = stock_score
    mental[:score] = stock_mental


    score.save
    mental.save
    puts score.to_json
    puts mental.to_json

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
