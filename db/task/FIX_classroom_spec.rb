def parse_maximum_code(course)
  max_session  = Classroom.where(course: course).maximum("spec")[10..11].to_i rescue 0
  return "#{'%02d' % ( max_session + 1)}"
end

Classroom.all.order('id ASC').each do |cs|
  course_id = Course.find(cs[:course])[:session_id]
  puts "#{cs[:id]} | #{cs[:spec]} | #{cs[:course]} | #{course_id}"
  cs[:spec] = "#{course_id}#{parse_maximum_code(cs[:course])}"
  cs.save
end

# Clear - every classroom spec
# Classroom.all.order('id ASC').each do |cs|
#   cs[:spec] = ""
#   cs.save
# end

# Runner - classroom spec
# Classroom.all.order('id ASC').each do |cs|
#   puts cs[:spec]
# end
