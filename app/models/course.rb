class Course < ApplicationRecord

  def self.count_all
    return self.all.count
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

  def self.parse_major(key)
    case key
    when "ENG" then return "ภาษาอังกฤษ"
    when "THA" then return "ภาษาไทย"
    when "SCI" then return "วิทย์"
    when "SCIGIFT" then return "วิทย์ GIFTED"
    when "SOC" then return "สังคม"
    when "SKI" then return "ทักษะ"
    when "MAT" then return "เลข"
    when "MATGIFT" then return "เลข GIFTED"
    when "PHY" then return "ฟิสิกส์"
    when "CHE" then return "เคมี"
    when "BIO" then return "ชีวะ"
    else return "ไม่มีหมวด"
    end
  end

  def self.collect_student(key)
    result = 0
    class_list = Classroom.where(course: key)
    class_list.each do |c|
      result += Seat.find_student(c[:spec])
    end
    return result
  end

  def self.details(obj)
    return {
      id:    "C#{"%04d" % obj[:id]}" ,
      name:  obj[:name] ,
      major: parse_major(obj[:major]) ,
      grade: parse_grade(obj[:grade]) ,
      price: if obj[:price].present? then "#{obj[:price]} บาท" else '-' end ,
      seat:  "#{collect_student(obj[:id])} คน"
    }
  end
end
