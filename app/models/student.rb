class Student < ApplicationRecord

  def self.count_all
    return self.all.count
  end

  def self.query_by_school(school)
    ss = self.where( school: school)
    return {
      total: ss.count ,
      p1:    ss.where(grade: 1).count,
      p2:    ss.where(grade: 2).count,
      p3:    ss.where(grade: 3).count,
      p4:    ss.where(grade: 4).count,
      p5:    ss.where(grade: 5).count,
      p6:    ss.where(grade: 6).count,
      m1:    ss.where(grade: 7).count,
      m2:    ss.where(grade: 8).count,
      m3:    ss.where(grade: 9).count,
      m4:    ss.where(grade: 10).count,
      m5:    ss.where(grade: 11).count,
      m6:    ss.where(grade: 12).count,
    }
  end

  def self.parse_school(key)
    school = School.find(key)[:name]
    return school
  end

  def self.parse_grade(key)
    case key
    when 1 then return "ป.1"
    when 2 then return "ป.2"
    when 3 then return "ป.3"
    when 4 then return "ป.4"
    when 5 then return "ป.5"
    when 6 then return "ป.6"
    when 7 then return "ม.1"
    when 8 then return "ม.2"
    when 9 then return "ม.3"
    when 10 then return "ม.4"
    when 11 then return "ม.5"
    when 12 then return "ม.6"
    end
  end

  def self.parse_seat(key)
    parser = []
    seat_in = Seat.where(student: key.to_i)
    seat_in.each do |s|
      parser << s[:classroom]
    end
    return {
      c: seat_in.count ,
      t: parser
    }
  end


  def self.details(obj)
    return {
      name:	    obj[:nickname],
      grade:    parse_grade(obj[:grade]),
      seat:   parse_seat(obj[:student_code]),
      school:   parse_school(obj[:school]),
    	parent:	  if obj[:parent].present? then obj[:parent] else '-' end ,
      email:	  if obj[:email].present? then obj[:email] else '-' end ,
      tel:	    if obj[:tel].present? then obj[:tel] else '-' end ,
      line:	    if obj[:line].present? then obj[:line] else '-' end ,
    }
  end

end
