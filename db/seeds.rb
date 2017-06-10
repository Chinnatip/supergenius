# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'set'

def craw_file(key)
  return Rails.root.join('db','csv_stock','score',key)
end

csv_set = [
  "ENG4",
  "ENG5",
  "M1 MATH",
  "M1 SCI",
  "M1 SOC",
  "M1 THAI",
  "M2 MATH",
  "M2 SCI",
  "M2 SOC",
  "M2 THAI",
  "M3 ENG",
  "M3 MATH",
  "M3 SCI",
  "M3 SOC",
  "M3 THAI",
  "M4 MATH",
  "M4 PHY",
  "M5 MATH",
  "M6 MATH",
  "P2 ENG",
  "P2 MATH",
  "P2 SKILL",
  "P3 ENG",
  "P3 MATH",
  "P3 SCI",
  "P3 THAI",
  "P4 ENG",
  "P4 MATH",
  "P4 SCI",
  "P4 SOC",
  "P4 THAI",
  "P5 ENG SAT",
  "P5 ENG SUN",
  "P5 MATH SAT GIFTED",
  "P5 MATH SAT",
  "P5 MATH SUN",
  "P5 SCI SAT GIFTED",
  "P5 SCI SAT",
  "P5 SCI SUN",
  "P5 SOC SAT",
  "P5 SOC SUN",
  "P5 THAI SAT",
  "P5 THAI SUN",
  "P6 ENG SAT",
  "P6 ENG SAT2",
  "P6 ENG SUN",
  "P6 MATH SAT",
  "P6 MATH SAT2",
  "P6 MATH SUN",
  "P6 SCI SAT",
  "P6 SCI SAT2",
  "P6 SCI SUN",
  "P6 SOC SAT",
  "P6 SOC SAT2",
  "P6 SOC SUN",
  "P6 THAI SAT",
  "P6 THAI SAT2",
  "P6 THAI SUN"
]

def school_dictionary(key)
  school_key = [
    {key: 'คณะราษฎรบำรุงปทุมธานี' , value: 'คณะราษฎร์บำรุงปทุมธานี'},
    {key: 'คณะราษฎร์บำรุงปทุมธานี' , value: 'คณะราษฎร์บำรุงปทุมธานี'},
    {key: 'คณะราษฎร์ปทุมธานี' , value: 'คณะราษฎร์บำรุงปทุมธานี'},
    {key: 'คป' , value: 'คณะราษฎร์บำรุงปทุมธานี'},
    {key: 'จิตรลดา' , value: 'จิตรลดา'},
    {key: 'จุฬารัตน์วิทยา' , value: 'จุฬารัตน์วิทยา'},
    {key: 'ดอนเมืองทหารอากาศ' , value: 'ดอนเมืองทหารอากาศ'},
    {key: 'ทรงวิทย์' , value: 'ทรงวิทย์'},
    {key: 'ทิพพากร' , value: 'ทิพพากร'},
    {key: 'ทีปังกร' , value: 'ทีปังกร'},
    {key: 'ธรรมศาสตร์คลองหลวง' , value: 'ธรรมศาสตร์คลองหลวง'},
    {key: 'ธัญวิทย์' , value: 'ธัญวิทย์'},
    {key: 'บรรจบรักษ์' , value: 'บรรจบรักษ์'},
    {key: 'บริบูรณ์ศิลป์' , value: 'บริบูรณ์ศิลป์'},
    {key: 'บ้านพลอย' , value: 'บ้านพลอย'},
    {key: 'ปทุมวิลัย' , value: 'ปทุมวิไล'},
    {key: 'ปทุมวิไล' , value: 'ปทุมวิไล'},
    {key: 'ประชาธิปัตย์' , value: 'ประชาธิปัตย์'},
    {key: 'ประถมศึกษาธรรมศาสตร์' , value: 'ประถมศึกษาธรรมศาสตร์'},
    {key: 'ผดุงศิษย์' , value: 'ผดุงศิษย์พิทยา'},
    {key: 'ผะดุงศิษย์' , value: 'ผดุงศิษย์พิทยา'},
    {key: 'ผะดุงศิษย์พิทยา' , value: 'ผดุงศิษย์พิทยา'},
    {key: 'ผ่องสุวรรณ' , value: 'ผ่องสุวรรณ'},
    {key: 'พระหฤทัย นนทบุรี' , value: 'พระหฤทัยนนทบุรี'},
    {key: 'พระหฤทัยดอนเมือง' , value: 'พระหฤทัยดอนเมือง'},
    {key: 'พระหฤทัยนน' , value: 'พระหฤทัยนนทบุรี'},
    {key: 'พระหฤทัยนนทบุรี' , value: 'พระหฤทัยนนทบุรี'},
    {key: 'พระหฤทัยนนทุบรี' , value: 'พระหฤทัยนนทบุรี'},
    {key: 'พระหฤทัยนนท์' , value: 'พระหฤทัยนนทบุรี'},
    {key: 'พิชญศึกษา' , value: 'พิชญศึกษา'},
    {key: 'มาลาสวรรค์' , value: 'มาลาสวรรค์พิทยา'},
    {key: 'มาลาสวรรค์พิทยา' , value: 'มาลาสวรรค์พิทยา'},
    {key: 'มินนี่' , value: 'มินนี่'},
    {key: 'ยอแซฟอยุธยา' , value: 'เซนต์โยเซฟอยุธยา'},
    {key: 'รังสฤษฎ์' , value: 'รังสฤษฎ์'},
    {key: 'รังสิตวิทยา' , value: 'รังสิตวิทยา'},
    {key: 'ราชินีบน' , value: 'ราชินีบน'},
    {key: 'ฤทธิยะวรรณาลัย' , value: 'ฤทธิยะวรรณาลัย'},
    {key: 'ฤทธิยะวรรณาลัย 2' , value: 'ฤทธิยะวรรณาลัย 2'},
    {key: 'ฤว' , value: 'ฤทธิยะวรรณาลัย'},
    {key: 'วัฒนาวิทยาลัย' , value: 'วัฒนาวิทยาลัย'},
    {key: 'วัดดอนเมือง' , value: 'วัดดอนเมือง'},
    {key: 'วัดหงษ์' , value: 'วัดหงษ์'},
    {key: 'วัดเปรมประชา' , value: 'วัดเปรมประชา'},
    {key: 'วิภารัตน์' , value: 'วิภารัตน์'},
    {key: 'ศรีจิตรา' , value: 'ศรีจิตรา'},
    {key: 'สวนกุหลาบนนทบุรี' , value: 'สวนกุหลาบนนทบุรี'},
    {key: 'สวนกุหลาบนนท์' , value: 'สวนกุหลาบนนทบุรี'},
    {key: 'สวนกุหลาบรังสิต' , value: 'สวนกุหลาบรังสิต'},
    {key: 'สกร' , value: 'สวนกุหลาบรังสิต'},
    {key: ' สาธิต ม.รังสิต' , value: 'สาธิต ม.รังสิต'},
    {key: 'สาธิต ม.รังสิต' , value: 'สาธิต ม.รังสิต'},
    {key: 'สาธิตม.รังสิต' , value: 'สาธิต ม.รังสิต'},
    {key: 'สาธิต มศว. องรักษ์' , value: 'สาธิต มศว. องรักษ์'},
    {key: 'สาธิตวไลยลงกรณ์' , value: 'สาธิตวไลยลงกรณ์'},
    {key: 'สาธิตเกษตรศาสตร์' , value: 'สาธิตเกษตรศาสตร์'},
    {key: 'สามโคก' , value: 'สามโคก'},
    {key: 'สายปัญญา' , value: 'สายปัญญา'},
    {key: 'สายปัญญารังสิต' , value: 'สายปัญญารังสิต'},
    {key: 'สายปัญญารังสิต(เตี้ย)' , value: 'สายปัญญารังสิต'},
    {key: 'สารวิทยา' , value: 'สารวิทยา'},
    {key: 'สารสาสน์' , value: 'สารสาสน์'},
    {key: 'สารสาสน์รังสิต' , value: 'สารสาสน์วิเทศรังสิต'},
    {key: 'สารสาสน์วิเทศรังสิต' , value: 'สารสาสน์วิเทศรังสิต'},
    {key: 'สารสาสน์คลองหลวง' , value: 'สารสาสน์วิเทศคลองหลวง'},
    {key: 'สารสาสน์วิเทศคลองหลวง' , value: 'สารสาสน์วิเทศคลองหลวง'},
    {key: 'สารสาสน์วิเทศน์บางบัวทอง' , value: 'สารสาสน์วิเทศบางบัวทอง'},
    {key: 'สารสาสน์วิเทศบางบัวทอง' , value: 'สารสาสน์วิเทศบางบัวทอง'},
    {key: 'สารสาสน์วิเทศบางบอน' , value: 'สารสาสน์วิเทศบางบอน'},
    {key: 'สารสาส์นวิเทศบางบอน' , value: 'สารสาสน์วิเทศบางบอน'},
    {key: 'สารสาสน์ราชพฤกษ์' , value: 'สารสาสน์วิเทศราชพฤกษ์'},
    {key: 'สารสาสน์วิเทศราชพฤกษ์' , value: 'สารสาสน์วิเทศราชพฤกษ์'},
    {key: 'สารสาสน์วิเวศราชพฤกษ์' , value: 'สารสาสน์วิเทศราชพฤกษ์'},
    {key: 'หว' , value: 'หอวัง'},
    {key: 'หอวัง' , value: 'หอวัง'},
    {key: 'หอวังนนทบุรี' , value: 'หอวังนนทบุรี'},
    {key: 'อนุบาลปทุมธานี' , value: 'อนุบาลปทุมธานี'},
    {key: 'อนุบาลพระนครศรีอยุธยา' , value: 'อนุบาลพระนครศรีอยุธยา'},
    {key: 'อนุบาลอ่างทอง' , value: 'อนุบาลอ่างทอง'},
    {key: 'อมาตยกุล' , value: 'อมาตยกุล'},
    {key: 'อรรถมิตร' , value: 'อรรถมิตร'},
    {key: 'ออมสิน' , value: 'ออมสิน'},
    {key: 'อัมพรไพศาล' , value: 'อัมพรไพศาล'},
    {key: 'อัมมาตย์' , value: 'อมาตยกุล'},
    {key: 'อุดมวิทยา' , value: 'อุดมวิทยา'},
    {key: 'เฉลิมพระเกียรติ' , value: 'เฉลิมพระเกียรติ'},
    {key: 'เซนต์คาเบรียล' , value: 'เซนต์คาเบรียล'},
    {key: 'เซนต์ฟรัง' , value: 'เซนต์ฟรัง'},
    {key: 'เซนต์โยเซฟคอนแวนต์' , value: 'เซนต์โยเซฟคอนแวนต์'},
    {key: 'เซนต์โยเซฟเมืองเอก' , value: 'เซนต์โยเซฟเมืองเอก'},
    {key: 'เซนต์โยเมืองเอก' , value: 'เซนต์โยเซฟเมืองเอก'},
    {key: 'เทพศิรินทร์' , value: 'เทพศิรินทร์'},
    {key: 'เทศบาลท่าโขง' , value: 'เทศบาลท่าโขลง'},
    {key: 'เทศบาลท่าโขลง' , value: 'เทศบาลท่าโขลง'},
    {key: 'แย้มสอาด' , value: 'แย้มสอาด'},
    {key: 'โชคชัย' , value: 'โชคชัยรังสิต'},
    {key: 'โชคชัยรังสิต' , value: 'โชคชัยรังสิต'},
    {key: 'ไผทอุดมศึกษา' , value: 'ไผทอุดมศึกษา'},

    {key: 'ซฟ' , value: 'ซฟ'},
    {key: 'ซยม' , value: 'ซยม'},
    {key: 'สปร' , value: 'สปร'}
  ]
  result = key.to_s
  school_key.each do |s|
    if key == s[:key]
      result = s[:value]
    end
  end
  return result
end

def grade_dictionary(key)
  course = key.split(" ").map{ |x| x.strip }
  case course[0]
  when "ENG4" then return {t: 'ม.1', v: 7 }
  when "ENG5" then return {t: 'ม.2', v: 8 }
  when "P1" then return {t: 'ป.1', v: 1 }
  when "P2" then return {t: 'ป.2', v: 2 }
  when "P3" then return {t: 'ป.3', v: 3 }
  when "P4" then return {t: 'ป.4', v: 4 }
  when "P5" then return {t: 'ป.5', v: 5 }
  when "P6" then return {t: 'ป.6', v: 6 }
  when "M1" then return {t: 'ม.1', v: 7 }
  when "M2" then return {t: 'ม.2', v: 8 }
  when "M3" then return {t: 'ม.3', v: 9 }
  when "M4" then return {t: 'ม.4', v: 10 }
  when "M5" then return {t: 'ม.5', v: 11 }
  when "M6" then return {t: 'ม.6', v: 12 }
  end
end

def course_dictionary(key)
  course = key.split(" ").map{ |x| x.strip }
  if course[0] == 'ENG4'
    return {major: 'ENG' , grade: 7 }
  elsif course[0] == 'ENG5'
    return {major: 'ENG' , grade: 8 }
  else
    if course[3] == 'GIFTED'
      return {major: "#{course[1][0..2]}GIFT" , grade: 5 }
    else
      case course[0]
      when 'P1' then return {major: "#{course[1][0..2]}", grade: 1}
      when 'P2' then return {major: "#{course[1][0..2]}", grade: 2}
      when 'P3' then return {major: "#{course[1][0..2]}", grade: 3}
      when 'P4' then return {major: "#{course[1][0..2]}", grade: 4}
      when 'P5' then return {major: "#{course[1][0..2]}", grade: 5}
      when 'P6' then return {major: "#{course[1][0..2]}", grade: 6}
      when 'M1' then return {major: "#{course[1][0..2]}", grade: 7}
      when 'M2' then return {major: "#{course[1][0..2]}", grade: 8}
      when 'M3' then return {major: "#{course[1][0..2]}", grade: 9}
      when 'M4' then return {major: "#{course[1][0..2]}", grade: 10}
      when 'M5' then return {major: "#{course[1][0..2]}", grade: 11}
      when 'M6' then return {major: "#{course[1][0..2]}", grade: 12}
      end
    end
  end
end

def classroom_dictionary(key)
  current_year = '60'
  classroom = key.split(" ").map{ |x| x.strip }
  if classroom[0] == 'ENG4'
    return "#{classroom[0][0..2]}#{current_year}M101"
  elsif classroom[0] == 'ENG5'
    return "#{classroom[0][0..2]}#{current_year}M201"
  else
    # trigger date
    if classroom[2] == 'SAT' && classroom[3] == 'GIFTED'
      running = '03'
    elsif classroom[2] == 'SAT'
      running = '02'
    elsif classroom[2] == 'SAT2'
      running = '04'
    elsif classroom[2] == 'SUN'
      running = '05'
    else
      running = '01'
    end
    return "#{classroom[1][0..2]}#{current_year}#{classroom[0]}#{running}"
  end
end

# set variable
course_list = []
school_list = Set.new []
seats = 0
student_index = [1,1,1,1,1,1,1,1,1,1,1,1]


csv_set.each do |csv|
  data = File.open(craw_file(csv + '.csv'))
  classroom = {
    title: '',
    teacher: '',
    course: '',
    ref: classroom_dictionary(csv)
  }
  # puts csv

  data.each_with_index do |line,lineidx|
    # generate course
    if lineidx == 1
      cols = line.split(",").map{ |x| x.strip }
      cols[1].sub!('"', '')
      cols[1].sub!('"', '')
      classroom[:title] = cols[1]

      # create new course
      parsee = course_dictionary(csv)
      course = Course.where(major: parsee[:major] , grade: parsee[:grade]).first
      unless course
        course = Course.create(major: parsee[:major] , grade: parsee[:grade])
      end
      course[:name] = classroom[:title]
      course.save

      classroom[:course] = course[:id]
    end

    # add teacher in classroom
    if lineidx == 2
      cols = line.split(",").map{ |x| x.strip }
      cols[1].sub!('"', '')
      cols[1].sub!('"', '')
      cols[1].sub!("P'", '')
      cols[1].sub!("P' ", '')
      cols[1].sub!("พี่", '')
      cols[1].sub!("พี่", '')
      gt = ''
      teachers = cols[1].split("+").map{ |x| x.strip }
      teachers.each do |t|
        new_teacher = Teacher.where(name: t).first
        unless new_teacher
          new_teacher = Teacher.create(name: t)
        end
        if gt == ''
          gt += new_teacher[:id].to_s
        else
          gt += (',' + new_teacher[:id].to_s)
        end

      end
      classroom[:teacher] = gt
    end

    # create classrooms
    rooms = Classroom.where(spec: classroom_dictionary(csv) ).first
    unless rooms
      rooms = Classroom.create(spec: classroom_dictionary(csv))
    end
    rooms[:teacher] = classroom[:teacher]
    rooms[:name] = classroom[:title]
    rooms[:course] = classroom[:course]
    rooms.save

    # add student seat
    if lineidx > 3
      cols = line.split(",").map{ |x| x.strip }
      if cols[1].present?
        grade  = grade_dictionary(csv)
        school = school_dictionary(cols[2])

        # find or create new school
        sc = School.where(name: school).first
        unless sc
          sc = School.create(name: school)
        end

        # find or create new student
        children = Student.where(nickname: cols[1] , grade: grade[:v] , school: sc[:id] ).first
        unless children
          children = Student.create(nickname: cols[1] , grade: grade[:v] , school: sc[:id])
          # update student code
          index_code = student_index[grade[:v] - 1].to_i
          children[:student_code] =  ("%02d" % grade[:v]) + ("%03d" % index_code)
          children.save
          student_index[grade[:v] - 1] += 1
        end

        # create new seat in classroom
        occupy = Seat.where(classroom: classroom_dictionary(csv) ,student: children[:student_code]).first
        unless occupy
          occupy = Seat.create(classroom: classroom_dictionary(csv) ,student: children[:student_code])
        end
      end
    end
  end
end

# result briefing
puts "สรุปข้อมูล Super genius >>>>"

courses = Course.order(:name)
puts "จำนวนคอร์สทั้งหมด #{courses.count}"

room_list = Classroom.order(:name)
puts "จำนวนคลาสเรียนทั้งหมด #{room_list.count}ห้อง"
room_list.each do |r|
  seats = Seat.where(classroom: r[:spec]).count
  tname = []
  teacher_list = r[:teacher].split(",").map{ |x| x.strip }
  teacher_list.each do |t|
    collect = Teacher.find(t)
    tname << collect[:name]
  end
  puts "#{r[:spec]} | #{r[:name]} | ครูผู้สอน #{tname} | จำนวนนักเรียน #{seats}คน"
end


teach_list = Teacher.order(:name)
puts "จำนวนอาจารย์ทั้งหมด #{teach_list.count}คน"
teach_list.each do |t|
  puts t[:name]
end
puts

schools = School.order(name: :asc)
puts "จำนวนโรงเรียนทั้งหมด #{schools.count}โรงเรียน"
schools.each do |s|
  student_count = Student.where(school: s[:id]).count
  school_name = if s[:name] == '' then "> ไม่ทราบโรงเรียน" else s[:name] end
  puts "#{school_name} | #{student_count}คน"
end
puts

students = Student.order(name: :asc)
puts "จำนวนนักเรียนทั้งหมด #{students.count}คน"
#students.each do |s|
#  puts "#{s[:nickname]}"
#end
puts

all_seats = Seat.all.count
puts "จำนวนที่นั่งทั้งหมด = #{all_seats} ที่นั่ง"

# end crawling
puts
