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

# 1YEAR ERROR
# convince every grade that has error
# have to setup [range of grade]
# and "base grader" that is error issue
grade_list = [1,2,3,4,5,6,7,8,9,10,11,12]
grade_list.each_with_index do |gd,index|
  puts "Get grade #{gd}"
  base_grade = 73000
  inspector_code = base_grade - (index*1000)
  Student.where(grade: gd).pluck(:student_code).each do |st|
    code = st.to_i
    if code > inspector_code
      puts code
      fixed_code = ((inspector_code - 1000)/1000).to_s
      puts fixed_code
      error_student = Student.where(student_code: code, grade: gd).first
      error_student[:student_code] = "#{fixed_code}#{st[2..4]}"
      error_student.save
      puts error_student.student_code
    end
  end
end
