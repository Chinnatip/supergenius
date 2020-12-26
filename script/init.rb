require 'csv'


table = CSV.parse(File.read("./script/member_member-2020-07-21.csv"), headers: true)

table.each do |tb|
  student_code = tb[1]
  odm_member_id = tb[0]
  st = Student.find_by(student_code: student_code)
  st.odm_member_id = odm_member_id
  st.save
  # puts st.odm_member_id
end
