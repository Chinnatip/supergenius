module ReportHelper
  def find_score(classroom,student)
    exam  = Exam.where(classroom: classroom , student: student ,exam_type: 'scoring').first
    score = exam['score'] rescue "{\"0\":\"0\"}"
    return JSON.parse(score).values.map { |m| m.to_i rescue 0 }.reduce(:+)
  end
end
