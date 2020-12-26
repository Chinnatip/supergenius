spec_code = 256303060502
class_id  = Classroom.find_by(spec: spec_code).id
exam_list = Exam.where(classroom: class_id , exam_type: "scoring")

exam_list.each do |sc|
  get_score = JSON.parse(sc.score)
  reject_key = get_score.except!("5")
  # puts reject_key.to_json
  sc[:score] = reject_key.to_json
  sc.save
end
