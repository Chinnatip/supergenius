require 'rake'

task :update_student => :environment do
  puts "update student template >>>"
  students = [
    {nickname: 'ดรีม',school: 'โรงเรียนบ้านพลอย',tel_student: '-',tel_parent: '089-172-9445',name: 'เจริญทรัพย์',surname: 'อาจวิเชียร',gender: 'm',birth: '9-9-2010',grade: '1'},
{nickname: 'พริกไทย',school: 'โรงเรียนธัญวิทย์',tel_student: '-',tel_parent: '081-341-6868',name: 'สุกฤตา',surname: 'เพชรปานกัน',gender: 'f',birth: '8-5-2010',grade: '2'},
{nickname: 'พลอยขวัญ',school: 'โรงเรียนธัญวิทย์',tel_student: '-',tel_parent: '086-368-0243/065-589-1565',name: 'สิณฆ์สินี',surname: 'เฉลิมศรี',gender: 'f',birth: '9-9-2009',grade: '2'},
{nickname: 'นันท์',school: 'โรงเรียนโชคชัยรังสิต',tel_student: '082-323-1177',tel_parent: '084-139-3399',name: 'นันท์ณัศกรณ์',surname: 'ทวีทรัพย์มณี',gender: 'f',birth: '5-11-2007',grade: '4'},
{nickname: 'เล้ง',school: 'โรงเรียนบ้านพลอย',tel_student: '-',tel_parent: '086-306-2638',name: 'ภูมิรพี',surname: 'พันธุเมฆินทร์',gender: 'm',birth: '21-10-2008',grade: '4'},
{nickname: 'ฟู่',school: 'โรงเรียนธัญวิทย์',tel_student: '-',tel_parent: '089-773-9500/083-096-3651',name: 'พงสกรณ์',surname: 'ศักดิ์สวัสดิ์',gender: 'm',birth: '7-2-2008',grade: '4'},
{nickname: 'ใบเตย',school: 'โรงเรียนอนุบาลวัดอ่างทอง',tel_student: '087-119-6835',tel_parent: '081-345-7921/081-710-6053',name: 'หยาดน้ำฟ้า',surname: 'สวัสดี',gender: 'f',birth: '31-10-2007',grade: '4'},
{nickname: 'แพม',school: 'โรงเรียนโชคชัยรังสิต',tel_student: '090-956-9667',tel_parent: '081-259-8836',name: 'กัลยารัตน์',surname: 'นาคาบดี',gender: 'f',birth: '29-10-2007',grade: '4'},
{nickname: 'โซแปง',school: 'โรงเรียนเซนต์โยเซฟคอนแวนต์',tel_student: '-',tel_parent: '087-704-1211',name: 'พิชญ์สินี',surname: 'จิตเพราเพริด',gender: 'f',birth: '4-7-2008',grade: '4'},
{nickname: 'เพียง',school: 'โรงเรียนพระหฤทัยนนทบุรี',tel_student: '092-763-1482',tel_parent: '081-840-6375',name: 'เพียงฤทัย',surname: 'คงลำธาร',gender: 'f',birth: '8-2-2008',grade: '4'},
{nickname: 'ปุณณ์',school: 'โรงเรียนพระหฤทัยนนทบุรี',tel_student: '-',tel_parent: '083-960-6316',name: 'ปุณณวิชญ์',surname: 'สุวรรณธนรักษ์',gender: 'm',birth: '10-1-2008',grade: '4'},
{nickname: 'ณัช',school: 'โรงเรียนโชคชัยรังสิต',tel_student: '088-805-8018',tel_parent: '089-775-1303',name: 'ณัชพงษ์',surname: 'อาชววาณิชกุล',gender: 'm',birth: '18-6-2007',grade: '5'},
{nickname: 'เพชร',school: 'โรงเรียนธัญวิทย์',tel_student: '-',tel_parent: '087-683-3448/089-451-4468',name: 'วชิรวิทย์',surname: 'กองพิลา',gender: 'm',birth: '24-4-2007',grade: '5'},
{nickname: 'อีฟ',school: 'โรงเรียนสารสาสน์วิเทศรังสิต',tel_student: '-',tel_parent: '089-977-0626',name: 'มนต์ศิชา',surname: 'ม่วงศรีจันทร์',gender: 'f',birth: '15-5-2007',grade: '5'},
{nickname: 'ยูกิ',school: 'โรงเรียนฤทธิยะวรรณาลัย',tel_student: '090-927-6688',tel_parent: '087-906-7167/064-128-9000',name: 'ภูวสิษฏ์',surname: 'อาชนะ',gender: 'm',birth: '12-10-2006',grade: '5'},
{nickname: 'อ้อม',school: 'โรงเรียนสารสาสน์วิเทศคลองหลวง',tel_student: '094-963-8373',tel_parent: '081-733-7871',name: 'อภิญญา',surname: 'บัวสำลี',gender: 'f',birth: '31-7-2007',grade: '5'},
{nickname: 'แม็ค',school: 'โรงเรียนธัญวิทย์',tel_student: '-',tel_parent: '089-772-2367',name: 'ไกรวิชญ์',surname: 'เกียรติเมชา',gender: 'm',birth: '28-9-2006',grade: '5'},
{nickname: 'โฟโต้',school: 'โรงเรียนธัญวิทย์',tel_student: '088-992-4935',tel_parent: '081-992-8845',name: 'อัทรวัฒน์',surname: 'กุลศิรวัฒน์',gender: 'm',birth: '4-10-2006',grade: '5'},
{nickname: 'เนส',school: 'โรงเรียนอนุบาลปทุมธานี',tel_student: '061-554-3622',tel_parent: '085-6696-762',name: 'พีรณัฐ',surname: 'ทำสวน',gender: 'm',birth: '13-3-2007',grade: '5'},
{nickname: 'เป็นต่อ',school: 'โรงเรียนธัญวิทย์',tel_student: '-',tel_parent: '081-988-1198',name: 'เป็นต่อ',surname: 'เครือทองศรี',gender: 'm',birth: '10-1-2007',grade: '5'},
{nickname: 'เพลง',school: 'โรงเรียนธัญวิทย์',tel_student: '095-661-9693',tel_parent: '095-909-2555',name: 'ณภาภัช',surname: 'ภิรมย์',gender: 'f',birth: '15-3-2007',grade: '5'},
{nickname: 'ขวัญข้าว',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student: '084-668-9889',tel_parent: '095-469-6116',name: 'ธัญญาภา',surname: 'อารมณ์รัตน์',gender: 'f',birth: '3-10-2007',grade: '5'},
{nickname: 'จันทร์หอม',school: 'โรงเรียนธัญวิทย์',tel_student: '064-103-9587',tel_parent: '086-368-0243/065-589-1565',name: 'สุภัชญา',surname: 'เฉลิมศรี',gender: 'f',birth: '17-11-2006',grade: '5'},
{nickname: 'แม็ก',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student: '086-391-7341',tel_parent: '081-949-0838',name: 'ธนาธิป',surname: 'เย็นใย',gender: 'm',birth: '29-11-2005',grade: '6'},
{nickname: 'แพร',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student: '097-257-0986',tel_parent: '098-270-2925',name: 'พิมพิชชา',surname: 'เจริญฤทธิ์วัฒนา',gender: 'f',birth: '29-5-2006',grade: '6'},
{nickname: 'เช็ค',school: 'โรงเรียนวัดเปรมประชากร',tel_student: '093-225-1143',tel_parent: '081-309-1272',name: 'ธนกร',surname: 'ปัญญา',gender: 'm',birth: '25-7-2005',grade: '6'},
{nickname: 'โชกุน',school: 'โรงเรียนธัญวิทย์',tel_student: '097-170-0608',tel_parent: '083-079-5746',name: 'สหรัฐ',surname: 'เอี่ยมธนากุล',gender: 'm',birth: '16-9-2005',grade: '6'},
{nickname: 'โฟร์โมสต์',school: 'โรงเรียนธัญวิทย์',tel_student: '089-905-6754',tel_parent: '089-905-6754',name: 'วัฒนพงศ์',surname: 'อ่ำทิพย์',gender: 'm',birth: '30-11-2005',grade: '6'},
{nickname: 'เนเจอร์',school: 'โรงเรียนศรีจิตรา',tel_student: '091-603-2163',tel_parent: '084-655-5796',name: 'วสุพล',surname: 'พาณิชย์กิจเจริญ',gender: 'm',birth: '19-10-2005',grade: '6'},
{nickname: 'พอ',school: 'โรงเรียนพระหฤทัยนนทบุรี',tel_student: '-',tel_parent: '097-134-6188',name: 'พอ',surname: 'คงลำธาร',gender: 'm',birth: '1-4-2006',grade: '6'},
{nickname: 'มีมี่',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student: '081-782-2511',tel_parent: '089-203-7455',name: 'ปลายฟ้า',surname: 'พงษ์ศรีหดุลชัย',gender: 'f',birth: '5-1-2006',grade: '6'},
{nickname: 'น้ำขิง',school: 'โรงเรียนประถมศึกษาธรรมศาสตร์',tel_student: '-',tel_parent: '084-077-7743',name: 'ปริชญา',surname: 'ทองชุบ',gender: 'f',birth: '15-9-2005',grade: '6'},
{nickname: 'ผิงผิง',school: 'โรงเรียนไผทอุดมศึกษา',tel_student: '081-666-0060',tel_parent: '081-644-8231',name: 'บิวมิญช์',surname: 'นิตย์วิชญ์กร',gender: 'f',birth: '12-5-2006',grade: '6'},
{nickname: 'พั้นช์',school: 'โรงเรียนจิตรลดา',tel_student: '065-510-8490',tel_parent: '089-052-1800',name: 'ธัญวรัตม์',surname: 'เพ็ชรเจริญ',gender: 'f',birth: '13-3-2006',grade: '6'},
{nickname: 'นาย',school: 'โรงเรียนประถมศึกษาธรรมศาสตร์',tel_student: '093-164-1955',tel_parent: '086-826-5149',name: 'กฤษณะพงศ์',surname: 'แก้วสน',gender: 'm',birth: '17-2-2006',grade: '6'},
{nickname: 'เจเกอร์',school: 'โรงเรียนบ้านพลอย',tel_student: '-',tel_parent: '081-855-5049',name: 'รัชศร',surname: 'พู่ทองคำ',gender: 'm',birth: '3-11-2005',grade: '6'},
{nickname: 'แทน',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student: '095-181-8922',tel_parent: '086-786-9290',name: 'ธีธิษณุ',surname: 'ผ่องแผ้ว',gender: 'm',birth: '22-7-2005',grade: '6'},
{nickname: 'พลอย',school: 'โรงเรียนธัญวิทย์',tel_student: '095-723-4251',tel_parent: '090-979-0151',name: 'พรพรหม',surname: 'สุดขาว',gender: 'f',birth: '19-12-2005',grade: '6'},
{nickname: 'พลอย',school: 'โรงเรียนทิพพากรวิทยาการ',tel_student: '085-337-4944',tel_parent: '089-661-5171',name: 'ฐิตาภรณ์',surname: 'พานทอง',gender: 'f',birth: '24-8-2005',grade: '6'},
{nickname: 'เจอาร์',school: 'โรงเรียนธัญวิทย์',tel_student: '096-463-5002',tel_parent: '086-563-0071',name: 'ปัณณวิชญ์',surname: 'โพธิ์สพ',gender: 'm',birth: '15-12-2005',grade: '6'},
{nickname: 'นักบิน',school: 'โรงเรียนหอวัง',tel_student: '086-492-9582',tel_parent: '089-153-8660',name: 'อชิตพล',surname: 'จินดาพรรณ',gender: 'm',birth: '29-1-2005',grade: '7'},
{nickname: 'โอม',school: 'โรงเรียนดอนเมืองทหารอากาศบำรุง',tel_student: '090-989-9984',tel_parent: '082-646-2994/091-809-2552',name: 'ทรงภูมิ',surname: 'ธรรมจารี',gender: 'm',birth: '1-9-2005',grade: '7'},
{nickname: 'กานต์',school: 'โรงเรียนสวนกุหลาบวิทยาลัย รังสิต',tel_student: '083-720-3375',tel_parent: '095-108-5633',name: 'กานต์',surname: 'หัสแดง',gender: 'm',birth: '28-10-2005',grade: '7'},
{nickname: 'บีม',school: 'โรงเรียนหอวัง',tel_student: '087-508-9188',tel_parent: '090-880-3866',name: 'อธิภัทร',surname: 'ศิวะตระกูล',gender: 'm',birth: '8-9-2004',grade: '7'},
{nickname: 'มีมี่',school: 'โรงเรียนหอวัง',tel_student: '062-013-1212',tel_parent: '061-989-8811',name: 'ณัฐกฤตา',surname: 'แย้มคลี่',gender: 'f',birth: '20-11-2003',grade: '8'},
{nickname: 'หยงหยง',school: 'โรงเรียนหอวัง',tel_student: '095-001-8382',tel_parent: '094-295-3642',name: 'องครัตน์',surname: 'พัฒนาพงศ์สิน',gender: 'f',birth: '6-5-2004',grade: '8'},
{nickname: 'ภพ',school: 'โรงเรียนหอวัง',tel_student: '089-301-7884',tel_parent: '081-835-5413',name: 'กิตติภพ',surname: 'บริสุทธิ์',gender: 'm',birth: '16-4-2004',grade: '8'},
{nickname: 'ตง',school: 'โรงเรียนหอวัง',tel_student: '',tel_parent: '089-139-6798',name: 'ณชนก',surname: 'เสรีสุภัคกุล',gender: 'm',birth: '2-8-2004',grade: '8'},
{nickname: 'แพท',school: 'โรงเรียนสารสาสน์วิเทศรังสิต',tel_student: '-',tel_parent: '063-553-6556',name: 'วชิรวิช',surname: 'ลิมปสนธิพงศ์',gender: 'm',birth: '3-4-2004',grade: '8'},
{nickname: 'ท้องฟ้า',school: 'โรงเรียนนวมินทราชินูทิศ หอวัง นนทบุรี',tel_student: '097-275-2746',tel_parent: '089-139-6863',name: 'ภาสกร',surname: 'นาคา',gender: 'm',birth: '27-11-2003',grade: '8'},
{nickname: 'น้ำ',school: 'โรงเรียนสาธิตแห่งมหาวิทยาลัยเกษตรศาสตร์',tel_student: '092-596-8337',tel_parent: '080-292-7887',name: 'ไอริน',surname: 'สุขเลิศวรกุล',gender: 'f',birth: '6-6-2004',grade: '8'},
{nickname: 'พัฒน์',school: 'โรงเรียนสวนกุหลาบวิทยาลัย รังสิต',tel_student: '096-202-2347',tel_parent: '098-654-6535',name: 'พีรพัฒน์',surname: 'ทองแจ่ม',gender: 'm',birth: '14-8-2003',grade: '8'},
{nickname: 'นอร์ท',school: 'โรงเรียนพิชญศึกษา',tel_student: '090-889-6333',tel_parent: '081-639-0005/094-950-5622',name: 'ธรรมภณ',surname: 'สอาดโฉม',gender: 'm',birth: '20-1-2003',grade: '9'},
{nickname: 'โย',school: 'โรงเรียนสวนกุหลาบวิทยาลัย นนทบุรี',tel_student: '083-562-8190',tel_parent: '086-896-0045',name: 'เจริญยิ่ง',surname: 'ทนงค์',gender: 'm',birth: '14-9-2000',grade: '11'},
{nickname: 'เบลล์',school: 'โรงเรียนเซนต์โยเซฟเมืองเอก',tel_student: '083-064-8128',tel_parent: '081-949-0838',name: 'ณิชกานต์',surname: 'เย้นใย',gender: 'f',birth: '8-10-1999',grade: '12'},
  ]

  def decode_student_year(grade)
    buddhist_era_factor = 43
    total_collage_year  = 13
    current_year_in_ad  = Time.now.strftime('%Y')[2..3].to_i
    decode_year         = current_year_in_ad + buddhist_era_factor + total_collage_year
    return ("%02d" % (decode_year - grade.to_i)).to_s
  end

  def decode_student_runner(grade)
    parser = []
    grade_count = Student.where(grade: grade).maximum("student_code")[3..4].to_i rescue 0
    return ("%03d" % (grade_count + 1)).to_s # rescue "001"

  end

  def detatched_student_code(grade)
    grader  = decode_student_year(grade)
    counter = decode_student_runner(grade)
    return "#{grader}#{counter}"
  end

  # exception school collections
  except_school = []

  # Generate student
  students.each do |pupil|
    # puts "student > #{pupil[:name]} | #{pupil[:school]}"
    begin
      # track school_id
      unless pupil[:school] == '-'
        school_id = School.where(name: pupil[:school]).first[:id]
      else
        school_id = '-1'
      end

      # find or created
      if  Student.where(nickname: pupil[:nickname],grade: pupil[:grade].to_i ).count > 0
        st = Student.where(nickname: pupil[:nickname],grade: pupil[:grade].to_i ).first
        st[:name]     = pupil[:name]
        st[:surname]  = pupil[:surname]
        st[:tel]      = pupil[:tel_student]
        st[:tel_parent] = pupil[:tel_parent]
        st[:school]   = school_id
        st[:gender]   = pupil[:gender]
        st[:birthday] = pupil[:birth]
        st.save
      else
        puts "error | not found SHOULD EXISTS student #{pupil[:nickname]} , grade #{pupil[:grade]} >>>"
      end
    rescue
      puts "Exception school > #{pupil[:school]}"
      except_school <<  pupil[:school]
    end
  end

  # check school error
  puts except_school.uniq
  puts except_school.uniq.count
end
