class Teacher < ApplicationRecord

  def self.count_all
    return self.all.count
  end

  def self.parse_classroom(key)
    result = []
    get_class = Classroom.all
    get_class.each do |c|
      teacher_c = c[:teacher].split(",").map{ |x| x.strip }
      teacher_c.each do |check_teacher|
        if key.to_s == check_teacher.to_s
          result << c[:spec]
        end
      end
    end
    return result
  end

  def self.details(obj)
    return {
      classroom: parse_classroom(obj[:id]),
      email:    if obj[:email].present? then obj[:email] else '-' end ,
      tel:      if obj[:tel].present? then obj[:tel] else '-' end ,
      line:     if obj[:line].present? then obj[:line] else '-' end ,
      facebook: if obj[:facebook].present? then obj[:facebook] else '-' end
    }
  end


end
