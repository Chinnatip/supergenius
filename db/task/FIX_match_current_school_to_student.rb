Student.all.each do |st|
  puts st.name
  student_grade = st.grade
  case student_grade
    when 1..6
      st.school_primary = st.school
      st.save
      # puts st.school_primary
    when 7..12
      st.school_secondary = st.school
      st.save
      # puts st.school_secondary
    when 13
      st.school_university = st.school
      st.save
      # puts st.school_university
  end
end
