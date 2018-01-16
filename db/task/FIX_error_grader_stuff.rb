# check grade parser
grade = [1,2,3,4,5,6,7,8,9,10,11,12]
grade.each do |gr|
  puts Student.where(grade: gr).pluck(:student_code).uniq.sort
  puts
end

# convince grade 5 errors
Student.where(grade: 5).pluck(:student_code).uniq.sort
error_list = ["69079", "69080", "69081"]
error_list.each do |el|
  st = Student.where(student_code: el).first
  st[:student_code] = "68#{el[2..4]}"
  st.save
end
