class Seat < ApplicationRecord

  def self.find_student(key)
    return self.where(classroom: key).count
  end

  def self.seat_detail(seat)
    classroom = Classroom.find(seat[:classroom])
    period  = Course.find(classroom[:course])[:period]
    student = Student.where(student_code: seat[:student]).first
    # get_score  = Exam.where(classroom: seat[:classroom],student: seat[:student] ,exam_type: 'scoring').first[:score]
    # get_mental = Exam.where(classroom: seat[:classroom],student: seat[:student] ,exam_type: 'mental').first[:score]
    # scoring = Exam.parse_score_with_period(get_score , period , 'scoring')
    # mental  = Exam.parse_score_with_period(get_mental , period , 'mental')
    # packing together
    result = {
      student_code: student[:student_code] ,
      name:    student[:nickname] ,
      grade:   Student.parse_grade(student[:grade]) ,
      school:  Student.parse_school(Student.current_school(student)) ,
      comment: seat[:comment],
      # total:   Exam.total_score(scoring) ,
      # total_mental:  Exam.total_score(mental) ,
      # score:  {
      #   scoring:  scoring ,
      #   mental: mental
      # }
    }
    # puts 'get result >>>'
    # puts result.to_json
    return result
  end


end
