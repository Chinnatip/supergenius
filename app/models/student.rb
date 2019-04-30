require 'date'
class Student < ApplicationRecord

  def self.count_all
    return self.all.count
  end

  def self.query_by_class
    ss = self.all
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

  def self.score_rate(score)
    case score
    when 0
      return {img: '⚪' ,ment: '-'}
    when 1..3
      return  {img: '👽' ,ment: 'Bad'}
    when 4..6
      return  {img: '☹️' ,ment: 'Not really'}
    when 7..8
      return  {img: '😀' ,ment: 'Good'}
    when 9..10
      return  {img: '😍' ,ment: 'Great'}
    end
  end

  def self.search(search,type)
    if search
      # return self.where(spec: search)
      if type == 'grade'
        grade_dic = Student.reverse_grade(search)
        return self.where(grade: grade_dic)
      elsif type == 'school'
        school_dic = School.where("name like ?", "%#{search}%").pluck(:id) rescue ''
        return self.where(school: school_dic)
      else
        return self.where("#{type} LIKE ?", "%#{search}%").all
      end
    else
      return self.all
    end
  end

  def self.parse_school(key)
    school = School.find(key)[:name] rescue "ไม่ทราบโรงเรียน"
    return school
  end

  def self.reverse_grade(grade)
    case grade
    when "ป.1" then return 1
    when "ป.2" then return 2
    when "ป.3" then return 3
    when "ป.4" then return 4
    when "ป.5" then return 5
    when "ป.6" then return 6
    when "ม.1" then return 7
    when "ม.2" then return 8
    when "ม.3" then return 9
    when "ม.4" then return 10
    when "ม.5" then return 11
    when "ม.6" then return 12
    else
      return 5
    end
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
    seat_in = Seat.where(student: key)
    seat_in.each do |s|
      parser << s[:classroom]
    end
    return {
      c: seat_in.count ,
      t: parser
    }
  end

  def self.parser_gender(gender)
    if gender == "m"
      return "ชาย"
    elsif gender == "f"
      return "หญิง"
    else
      return "-"
    end
  end

  def self.parser_birthday(date)
    if date.present?
      dates = date.to_s.split("-")
      return Date.new(dates[2].to_i,dates[1].to_i,dates[0].to_i).strftime("%e %b %Y") rescue dates
    else
      return '-'
    end
  end

  def self.code(code)
    return Student.where(student_code: code).first
  end

  def self.parse_birthdate(date)
    if date.present?
      d_split = date.split("-")
      if d_split.count > 1
        return "#{d_split[0].to_s.rjust(2,'0')}#{d_split[1].to_s.rjust(2,'0')}"
      else
        return "0000"
      end
    else
      return "0000"
    end
  end

  def self.current_school(student)
    student_grade = student.grade
    case student_grade
      when 1..6
        return student.school_primary
      when 7..12
        return student.school_secondary
      when 13
        return student.school_university
    end
  end


  def self.details(obj)
    return {
      id:       obj[:id],
      name:	    obj[:nickname],
      code:     obj[:student_code],
      grade:    parse_grade(obj[:grade]),
      seat:     parse_seat(obj[:student_code]),
      school:   parse_school(current_school(obj)),
    	parent:	  if obj[:parent].present? then obj[:parent] else '-' end ,
      email:	  if obj[:email].present? then obj[:email] else '-' end ,
      tel:	    if obj[:tel].present? then obj[:tel] else '-' end ,
      line:	    if obj[:line].present? then obj[:line] else '-' end ,
      gender:   parser_gender(obj[:gender]),
      birthday: parser_birthday(obj[:birthday])
    }
  end

  def self.seperate_class(code)
    res = Student.where(student_code: code).pluck(:grade).sort
    count = res.inject({}) do |counter, item|
      counter[item]  ||= 0
      counter[item]  += 1
      counter
    end
    return count
  end

  def self.seperate_school(code)
    school_collection = []
    Student.where(student_code: code).each do |st|
      if  Student.current_school(st) != nil
        school_collection << Student.current_school(st)
      end
    end
    puts 'debugger#2 :: LOG SCHOOL'
    puts  school_collection
    puts 'END LOG SCHOOL'
    res = {}
    school_list = school_collection.sort
    school_uniq = school_collection.uniq.sort
    school_uniq.each do |sc|
      res[sc] = 0
      school_list.each do |unit|
        if sc == unit
          res[sc] += 1
        end
      end
    end
    # res = collector.uniq.sort
    # count = res.inject({}) do |counter, item|
    #   counter[item]  ||= 1
    #   counter[item]  += 1
    #   counter
    # end
    puts res.to_json
    return res
  end

end
