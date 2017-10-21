class Classroom < ApplicationRecord

  def self.count_all
    return self.all.count
  end

  def self.check_time(time)
    if time.present?
      return time.strftime("%H:%M")
    else
      return '..'
    end
  end

  def self.check_period(day)
    if day.present?
      return day.strftime('%d %b %Y')
    else
      return '..'
    end
  end

  def self.search(search,type)
    if search
      if type == 'spec'
        return self.where("spec LIKE ?", "%#{search.upcase}%").all
      elsif type == 'teacher'

        teacher_dic = Teacher.where("name LIKE ?", "%#{search}%").first[:id]
        # teacher_dic = Teacher.where(name: search).first[:id]
        return self.where(teacher: teacher_dic)
      else
        return self.all
      end
    else
      return self.all
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
    teachers = ts.split(",").map{ |x| x.strip } rescue [1]
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

  def self.details(obj)
    return {
      teacher:            parse_teacher(obj[:teacher]) ,
      seat:               Seat.where(classroom: obj[:id]).count ,
      course_period_from: "#{check_period(obj[:start])}",
      course_period_to:   "#{check_period(obj[:end])}",
      timetable_from:     "#{check_time(obj[:start_time])}",
      timetable_to:       "#{check_time(obj[:end_time])}",
      price:      if obj[:price].present? then "#{obj[:price].floor} บาท" else '-' end ,
      status:     if obj[:status].present? then "#{obj[:status]}" else '-' end ,
      schedule:   if obj[:period].present? then "#{obj[:period]}" else '-' end ,
    }
  end

end
