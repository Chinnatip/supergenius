class Classroom < ApplicationRecord

  def self.count_all
    return self.all.count
  end

  def self.check_time(time)
    if time.present?
      return time
    else
      return '..'
    end
  end

  def self.check_period(day)
    if day.present?
      return day
    else
      return '..'
    end
  end

  def self.check_seat(seat)
    if seat.present?
      return seat
    else
      return 100
    end
  end

  def self.parse_teacher(ts)
    result = ''
    teachers = ts.split(",").map{ |x| x.strip }
    teachers.each do |t|
      parser = Teacher.find(t)[:name]
      if result.present?
        result += ",#{parser.to_s}"
      else
        result += parser.to_s
      end
    end
    return result
  end

  def self.parse_seat(class_code)
    return Seat.find_student(class_code)
  end

  def self.details(obj)
    return {
      teacher:    parse_teacher(obj[:teacher]) ,
      seat:       "#{parse_seat(obj[:spec])}/#{check_seat(obj[:seat])}" ,
      course_period: "#{check_period(obj[:start])} - #{check_period(obj[:end])}",
      timetable:  "#{check_time(obj[:start_time])} - #{check_time(obj[:end_time])}",
      price:      if obj[:price].present? then "#{obj[:price]} บาท" else '-' end ,
      status:     if obj[:status].present? then "#{obj[:status]}" else '-' end ,
      schedule:   if obj[:schedule].present? then "#{obj[:schedule]}" else '-' end ,

    }
  end

end
