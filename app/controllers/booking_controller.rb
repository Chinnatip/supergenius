class BookingController < ApplicationController
  layout "booking"
  require 'Date'

  # GET /index
  def index
    prepare_selected_date()
    prepare_render_option()
    prepare_time_table()
    @param_log = "คุณยังไม่ได้กรอกข้อมูลสำตัญลงในช่องได้แก่ "
    if params[:input] === 'false'
      if params[:commited] === 'false'
        @param_log += "/ ไม่ได้กด ยืนยัน  "
      end
      if params[:live_date] === 'false'
        @param_log += "/ ไม่ได้ใส่วันที่ของ คอร์สสอนสด "
      end
      if params[:attend_start_date] === 'false'
        @param_log += "/ ไม่ได้ใส่วันที่จะ เข้ามาเรียน "
      end
    end
  end

  def finish
    @course_schedules = CourseSchedule.where(student_id: '0248015').order(:attend_start)
  end

  def add_course
    checker = prepare_course(params)
    #
    if checker[:result]
      time_parse = date_parser(params)
      seat = params[:attend_seat]
      #
      if time_slot_validator(time_parse,seat)
        CourseSchedule.create({
          student_id:    params[:student_id],
          course:        params[:course],
          live_date:     time_parse[:live],
          attend_start:  time_parse[:start],
          attend_finish:  time_parse[:finish],
          attent_hour:   time_parse[:hour][:common],
          attend_reason: params[:attend_reason],
          attend_seat:   seat,
          ref_code:      "#{params[:course]}-#{Array.new(4){[*"A".."Z", *"0".."9"].sample}.join}"
        })
        redirect_to booking_finish_path
      else
        prep_date = time_parse[:start_day].strftime("%d-%b-%Y")
        prep_time = "#{time_parse[:start].strftime('%H.%M')}-#{time_parse[:finish].strftime('%H.%M')}"
        redirect_to booking_index_path({valid: false, seat: seat, date: prep_date, time: prep_time })
      end
    else
      redirect_to booking_index_path(checker[:error])
    end
  end

  private
    def prepare_course(params)
      checker     = true
      null_params = { input: false }
      if params.keys.index("commited") === nil
        checker     =  false
        null_params["commited"] = false
      end
      params.keys.each do |pkey|
        if params[pkey] === ''
          checker     =  false
          null_params[pkey] = false
        end
      end
      return { result: checker, error: null_params }
    end

    def time_trigger(learning)
      return true
    end

    def course_schedule_params
      params.require(:course_schedule).permit(:student_id, :course, :live_date, :attend_start, :attend_finish, :attent_hour, :attend_reason)
    end

    def date_parser(params)
      live_date   = Date.strptime(params[:live_date], "%Y-%m-%d")
      attend_date = Date.strptime(params[:attend_start_date], "%Y-%m-%d")
      start_time  = params[:attend_start_time]
      learn_time  = params[:attent_hour]
      return {
        live:  live_date,
        start_day: attend_date,
        end_day: attend_date + 1.day,
        start: attend_date + mins(start_time),
        finish: attend_date + mins(start_time) + mins(learn_time),
        hour:  parse_hour(learn_time)
      }
    end

    def between_find(time,schedule)
      return time.between?(schedule.attend_start, schedule.attend_finish)
    end

    def time_slot_validator(time_parse,seat)
      validator  = true
      day_range  = time_parse[:start_day]..time_parse[:end_day]
      start_time = time_parse[:start] + 1.minute
      finish_time = time_parse[:finish] - 1.minute
      # CourseSchedule.where(attend_start: day_range, attend_seat: seat ).each do |schedule|
      CourseSchedule.where(attend_seat: seat ).each do |schedule|
        puts 'xxxx'
        if between_find( start_time ,schedule) || between_find( finish_time , schedule )
          puts 'nono invalid'
          validator = false
        end
      end
      puts "From seat#{seat} #{time_parse[:start].strftime('%d-%b-%Y %H:%M')} - #{time_parse[:finish].strftime('%H:%M')}"
      puts "valid >> #{validator}"
      return validator
    end

    def parse_numeric_to_hour(time)
      hour = time.floor
      min  = ((time - hour) * 60).floor
      return "#{hour}:#{format('%02d', min)}"
    end

    def prepare_render_option
      @render_option_weekend = render_option(7.5 , 20)
      @render_option_workday = render_option(9 , 19.5)
      @render_duration = render_duration(6)
      @render_seat     = render_seat(10)
    end

    def prepare_selected_date
      today          = Date.today
      @date_now      = today.strftime("%Y-%m-%d")
      @date_tomorrow = (today + 1.day).strftime("%Y-%m-%d")
    end

    def render_option(from,to)
      res = []
      while from <= to  do
        res.push({
          option: parse_numeric_to_hour(from) ,
          value:  (from * 60).floor
        })
        from += 0.5
      end
      return res
    end

    def render_duration(amount)
      res  = [ {option: '30 นาที',value: 30} ]
      from = 1
      while from <= amount do
        res.push({
          option: "#{from} ชั่วโมง",
          value:  "#{from * 60}"
        })
        from += 1
      end
      return res
    end

    def render_seat(amount)
      res  = []
      from = 1
      while from <= amount do
        res.push({
          option: "เครื่องที่ #{from}",
          value:  "#{from}"
        })
        from += 1
      end
      return res
    end

    def mins(params)
      return params.to_i.minutes
    end

    def parse_hour(time)
      ptime = time.to_i
      return {
        hour:   ptime/60 ,
        min:    ptime%60,
        common: "#{ptime/60}:#{ format('%02d', ptime%60) }"
      }
    end

    def prepare_time_table
      @time_table = [
        {text: 'ส.2/6/61 - ศ.8/6/61',week: 1},
        {text: 'ส.2/6/61 - ศ.8/6/61',week: 2},
        {text: 'ส.2/6/61 - ศ.8/6/61',week: 3},
        {text: 'ส.2/6/61 - ศ.8/6/61',week: 4},
        {text: 'ส.2/6/61 - ศ.8/6/61',week: 5},
        {text: 'ส.2/6/61 - ศ.8/6/61',week: 6},
        {text: 'ส.2/6/61 - ศ.8/6/61',week: 7},
        {text: 'ส.2/6/61 - ศ.8/6/61',week: 8},
        {text: 'ส.2/6/61 - ศ.8/6/61',week: 9},
        {text: 'ส.2/6/61 - ศ.8/6/61',week: 10},
        {text: 'ส.2/6/61 - ศ.8/6/61',week: 11},
        {text: 'ส.2/6/61 - ศ.8/6/61',week: 12},
        {text: 'ส.2/6/61 - ศ.8/6/61',week: 13}
      ]
    end
end
