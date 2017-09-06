def parse_major(key)
  case key
  when "ENG" then return "ภาษาอังกฤษ"
  when "THA" then return "ภาษาไทย"
  when "SCI" then return "วิทยาศาสตร์"
  when "SCIGIFT" then return "วิทยาศาสตร์ GIFTED"
  when "SOC" then return "สังคม"
  when "SKI" then return "ทักษะการเรียน"
  when "MAT" then return "คณิตศาสตร์"
  when "MATGIFT" then return "คณิตศาสตร์ GIFTED"
  when "PHY" then return "ฟิสิกส์"
  when "CHE" then return "เคมี"
  when "BIO" then return "ชีวะ"
  else return "ไม่มีหมวด"
  end
end

def parse_grade(key)
  case key
  when 1 then return "ป.1"
  when 2 then return "ป.2"
  when 3 then return "ป.3"
  when 4 then return "ป.4"
  when 5 then return "ป.5"
  when 6 then return "ป.6"
  when 7 then return "ม.1"
  when 8 then return "ม.2"
  when 9 then return "ม.3"
  when 10 then return "ม.4"
  when 11 then return "ม.5"
  when 12 then return "ม.6"
  end
end


Course.all.each do |cs|
  # major / grade
  # puts cs.name
  new_name = "#{parse_major(cs.major)} - #{parse_grade(cs.grade)}"
  cs.name  = new_name
  cs.save
end
