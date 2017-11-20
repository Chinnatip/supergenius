#
st = Student.where(nickname: "นาจา" , grade: 11).first
st[:student_code] = "62014"
st.save

st = Student.where(nickname: "คิว" ,   grade: 11).first
st[:student_code] = "62015"
st.save

st = Student.where(nickname: "ทัวร์" ,  grade: 11).first
st[:student_code] = "62011"
st.save

st = Student.where(nickname: "พีม" ,   grade: 11).first
st[:student_code] = "62012"
st.save

#
st = Student.where(nickname: "เอ๊ะ" ,   grade: 10).first
st[:student_code] = "63015"
st.save

st = Student.where(nickname: "อัญอัญ" ,   grade: 9).first
st[:student_code] = "64051"
st.save

st = Student.where(nickname: "พลอย" ,   grade: 9, school: 2).first
st[:student_code] = "64003"
st.save

st = Student.where(nickname: "เจิ้น" ,   grade: 8).first
st[:student_code] = "65063"
st.save

#
st = Student.where(nickname: "แม๊ค" ,   grade: 4).first
st[:student_code] = "69049"
st.save

st = Student.where(nickname: "บุ๋น" ,   grade: 4).first
st[:student_code] = "69048"
st.save

st = Student.where(nickname: "สวิส" ,   grade: 3).first
st[:student_code] = "70023"
st.save

#
st = Student.where(nickname: "บุญ" ,   grade: 2).first
st[:student_code] = "71011"
st.save

st = Student.where(nickname: "มีญ่า" ,   grade: 1).first
st[:student_code] = "72009"
st.save
