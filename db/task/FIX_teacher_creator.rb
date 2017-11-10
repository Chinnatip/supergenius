teacher_lists = [{ name: "พี่แพรว",
 email: "praewjitnalin@gmail.com",
 pass: "30121984",
},
{
 name: "พี่เมย์",
 email: "pantipa.nob@gmail.com",
 pass: "23041991",
},
{
 name: "พี่อ้อน",
 email: "Kamonpat.pohtong@gmail.com",
 pass: "22091986",
},
{
 name: "พี่มิ้น",
 email: "Mr.narin.l@gmail.com",
 pass: "03011990",
},
{
 name: "พี่ป๊อป",
 email: "Pop.thebright@gmail.com",
 pass: "12071989",
},
{
 name: "พี่ทาโร้",
 email: "mister_tutor@hotmail.com",
 pass: "02031990",
},
{
 name: "พี่เกรซ",
 email: "irin.k@arts.tu.ac.th",
 pass: "061194",
},
{
 name: "พี่บอส",
 email: "boss251252@gmail.com",
 pass: "28031993",
},
{
  name: "พี่วิน",
  email: "winnie665bs@hotmail.com",
  pass: "300790"
}]

# Update teacher data
teacher_lists.each do |ts|
  t = Teacher.where(name: ts[:name]).first
  t[:email] = ts[:email]
  t[:password] = ts[:pass]
  t.save
end

# create teacher login
Teacher.all.each do |ts|
  t_uid = "T#{format('%02d', ts.id.to_i)}"
  t_password = ts.password.present? ? ts.password : "supergenius2017"
  t_email = ts.email.present? ? ts.email : "#{t_uid.downcase}@supergenius.com"
  # puts "#{t_uid} #{ts.name}"
  # puts t_email
  # puts t_password
  unless User.where(uid: t_uid).count > 0
    User.create!(
      role: "teacher" ,
      email: t_email ,
      password: t_password ,
      name: ts.name,
      uid: t_uid
    )
  end
end

# sampling create teacher
Teacher.create!(name: "พี่วิน", surname: "",major: "", email: "", tel: "897906279")
Teacher.create!(name: "พี่แพรว", surname: "",major: "", email: "", tel: "")
Teacher.create!(name: "พี่เกรซ", surname: "",major: "", email: "", tel: "")
Teacher.create!(name: "พี่มิ้น", surname: "",major: "", email: "", tel: "")
Teacher.create!(name: "พี่เมย์", surname: "",major: "", email: "", tel: "")
Teacher.create!(name: "พี่บอส", surname: "",major: "", email: "", tel: "")
Teacher.create!(name: "พี่อ้อน", surname: "",major: "", email: "", tel: "")
Teacher.create!(name: "พี่ทาโร้", surname: "",major: "", email: "", tel: "")
Teacher.create!(name: "พี่ป๊อป", surname: "",major: "", email: "", tel: "0853348815")
