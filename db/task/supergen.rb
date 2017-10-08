puts "Running supergen.task.rb"

user_data = [
  {
    email: 'chinnatip@me.com',
    name:  'Chinnatip Taemkaeo',
    role:  'admin',
    password: 'Cupurion23',
    password_confirmation: 'Cupurion23',
    is_super_admin: true ,
  },
  {
    email: 'supergeniusschool@gmail.com',
    name:  'supergenius',
    role:  'admin',
    password: 'supergeniusadmin',
    password_confirmation: 'supergeniusadmin',
    is_super_admin: true ,
  }
]

user_data.each do |us|
  user_find = User.where(email: us[:email]).first
  unless user_find
    user_find = User.create(email: us[:email])
  end
  user_find.role = us[:role]
  user_find.name = us[:name]
  user_find.password = us[:password]
  user_find.password_confirmation = us[:password_confirmation]
  user_find.is_super_admin = us[:is_super_admin]
  user_find.save
end

puts "created"



puts "decode student"
def decode_student_year(grade)
  inspector = Time.now.strftime('%Y')[2..3].to_i + 56
  return ("%02d" % (inspector - grade.to_i)).to_s
end

def detatched_student_code(grade,runner)
  grader  = decode_student_year(grade)
  return "#{grader}#{runner}"
end

puts "refactor student code"
Student.all.each do |sc|
  puts "#{sc[:student_code]}  >> #{detatched_student_code(sc[:grade] , sc[:student_code][2..4])}"
  if sc[:student_code][0..1].to_i < 20
    sc[:student_code] = detatched_student_code(sc[:grade] , sc[:student_code][2..4])
    sc.save
  end

  unless sc[:secret_id].present?
    puts 'blank id'
    sc[:secret_id] = Random.new.rand(100_000..1_000_000).to_s
    sc.save
  end
end
puts
puts "refactor seat code"
Seat.all.each do |se|
  grade = se[:student][0..1]
  puts "#{se[:student]}  >> #{detatched_student_code(grade , se[:student][2..4])}"
  if se[:student][0..1].to_i < 20
    se[:student] = detatched_student_code(grade , se[:student][2..4])
    se.save
  end
end
puts
puts "refactor exam code"
Exam.all.each do |ex|
  grade = ex[:student][0..1]
  puts "#{ex[:student]}  >> #{detatched_student_code(grade , ex[:student][2..4])}"
  if ex[:student][0..1].to_i < 20
    ex[:student] = detatched_student_code(grade , ex[:student][2..4])
    ex.save
  end
end
puts "ended"


puts 'set current class of every classroom to 3th'
Classroom.all.each do |cs|
  cs[:current] = 3
  cs.save
end
