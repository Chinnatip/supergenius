sort_student = Student.all.order(:student_code)
sort_student.each_with_index do |st,index|
  # if sort_student[index - 1][:student_code] == st[:student_code]
  #   puts "dup!! | #{st[:student_code]} | #{st[:nickname]}"
  #   grade    = st[:grade]
  #   max_code = Student.where(grade: grade).maximum('student_code')
  #   new_code = max_code.to_i + 1
  #   st[:student_code] = new_code
  #   st.save
  #   puts "new code is #{st[:student_code]}!!"
  # end
  puts "dup!! | #{st[:student_code]} | #{st[:nickname]}"
end
