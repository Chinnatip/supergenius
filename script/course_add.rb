# course_lists = ['256303070404', '256303080705', '256303040504', '256303080704', '256303090305', '256303060405', '256303090307', '256303080601', '256303050504', '256303060603', '256303080701', '256303070405', '256303050605', '256303090304', '256303050404', '256303080802', '256303090303', '256303080703', '256303060504', '256303050606', '256303050502', '256303040603', '256303050403', '256303050702', '256303080702', '256303070704', '256303060501', '256303040503', '256303060404', '256303080604', '256303081004', '256303070402', '256303070703', '256303040502', '256303060402', '256303070401', '256303040601', '256303060502', '256303090503', '256303070403', '256303050603', '256303090302', '256303080606', '256303050503', '256303050405', '256303070406', '256303040602', '256303080801', '256303080603', '256303070502', '256303050501', '256303090501', '256303060403', '256303060503', '256303040505', '256303060602', '256303080706', '256303050401', '256303070501', '256303050601', '256303080605', '256303050701', '256303081003', '256303050604', '256303050505', '256303090301', '256303060601', '256303090502', '256303050703', '256303060401', '256303090306', '256303060505', '256303050402', '256303080602']
# res = []
# course_lists.each do |cs|
#   cf = Classroom.find_by(spec: cs)
#   res << "#{cf.id}|#{cf.name}|#{cf.spec}|#{cf.course}"
# end

# puts res

course_lists = []
Classroom.all.pluck(:spec).each do |cs|
  convert = cs.to_i
  if convert >= 256303000000
    course_lists << convert
  end
end

puts course_lists.count

res = []
course_lists.each do |cs|
  cf     = Classroom.find_by(spec: cs)
  course = Course.find(cf.course)
  res << "#{cf.id}|#{cf.name}|#{cf.spec}|#{cf.course}|#{course.name}|#{course.grade}|#{course.semester}"
end

puts res


# Export list
# 605|ป.5 BOOST ไทย|256303050504|234|ป.5 กลุ่มวันเสาร์ ห้อง B|5|256303
# 642|ม.1 MASTER วิทย์|256303070502|242|ม.1 MASTER / SUPREME|7|256303
# 616|ป.6 ENT คณิต |256303060401|236|ป.6 กลุ่มวันเสาร์|6|256303
# 640|ม.2 BOOST สังคม|256303080706|241|ม.2 BOOST |8|256303
# 655|ม.3 EXTRA วิทย์ B|256303090304|246|ม.3 ENT EXTRA|9|256303
# 637|ม.2 BOOST วิทย์ SS|256303080703|241|ม.2 BOOST |8|256303
# 656|ม.3 ENT อังกฤษ |256303090305|246|ม.3 ENT EXTRA|9|256303
# 624|ป.6 ENT สังคม|256303060504|237|ป.6 กลุ่มวันอาทิตย์|6|256303
# 607|ป.5 MASTER คณิต|256303050701|248|ป.5 MASTER|5|256303
# 636|ม.2 BOOST คณิต B|256303080702|241|ม.2 BOOST |8|256303
# 638|ม.2 BOOST วิทย์ GG|256303080704|241|ม.2 BOOST |8|256303
# 619|ป.6 ENT สังคม|256303060404|236|ป.6 กลุ่มวันเสาร์|6|256303
# 593|ป.4 BOOST สังคม|256303040505|231|ป.4 กลุ่มวันอาทิตย์|4|256303
# 653|ม.3 ENT คณิต part2 - B|256303090302|246|ม.3 ENT EXTRA|9|256303
# 644|ม.2 MASTER วิทย์|256303080802|243|ม.2 MASTER / SUPREME|8|256303
# 631|ม.1 BOOST วิทย์ SS|256303070403|239|ม.1 BOOST |7|256303
# 647|ม.1 SUPREME คณิต|256303070703|242|ม.1 MASTER / SUPREME|7|256303
# 613|ป.5 BOOST อังกฤษ|256303050604|235|ป.5 กลุ่มวันอาทิตย์|5|256303
# 614|ป.5 BOOST ไทย|256303050605|235|ป.5 กลุ่มวันอาทิตย์|5|256303
# 628|ป.6 MASTER อังกฤษ|256303060603|238|ป.6 MASTER|6|256303
# 643|ม.2 MASTER คณิต|256303080801|243|ม.2 MASTER / SUPREME|8|256303
# 608|ป.5 MASTER วิทย์|256303050702|248|ป.5 MASTER|5|256303
# 633|ม.1 BOOST ไทย|256303070405|239|ม.1 BOOST |7|256303
# 592|ป.4 BOOST ไทย|256303040504|231|ป.4 กลุ่มวันอาทิตย์|4|256303
# 625|ป.6 ENT ไทย|256303060505|237|ป.6 กลุ่มวันอาทิตย์|6|256303
# 665|ม.1-ม.2 BOOST อังกฤษ Level 4|256303080604|240|ม.1-ม.2 ภาษาอังกฤษ|8|256303
# 579|ป.2 BOOST อังกฤษ|256303020202|228|ป.2|2|256303
# 583|ป.3 BOOST ไทย|256303030304|229|ป.3|3|256303
# 582|ป.3 BOOST อังกฤษ|256303030303|229|ป.3|3|256303
# 622|ป.6 ENT วิทย์|256303060502|237|ป.6 กลุ่มวันอาทิตย์|6|256303
# 634|ม.1 BOOST สังคม|256303070406|239|ม.1 BOOST |7|256303
# 601|ป.5 BOOST สังคม|256303050405|233|ป.5 กลุ่มวันเสาร์ ห้อง A|5|256303
# 600|ป.5 BOOST ไทย|256303050404|233|ป.5 กลุ่มวันเสาร์ ห้อง A|5|256303
# 615|ป.5 BOOST สังคม|256303050606|235|ป.5 กลุ่มวันอาทิตย์|5|256303
# 629|ม.1 BOOST คณิต A|256303070401|239|ม.1 BOOST |7|256303
# 578|ป.2 BOOST คณิต|256303020201|228|ป.2|2|256303
# 641|ม.1 MASTER คณิต|256303070501|242|ม.1 MASTER / SUPREME|7|256303
# 648|ม.1 SUPREME วิทย์|256303070704|242|ม.1 MASTER / SUPREME|7|256303
# 598|ป.5 BOOST วิทย์|256303050402|233|ป.5 กลุ่มวันเสาร์ ห้อง A|5|256303
# 659|ม.3 MASTER คณิต|256303090501|247|ม.3 MASTER|9|256303
# 668|ม.1-ม.2 MASTER อังกฤษ|256303080605|240|ม.1-ม.2 ภาษาอังกฤษ|8|256303
# 612|ป.5 BOOST วิทย์|256303050603|235|ป.5 กลุ่มวันอาทิตย์|5|256303
# 587|ป.4 BOOST ไทย|256303040404|230|ป.4 กลุ่มวันเสาร์|4|256303
# 654|ม.3 EXTRA วิทย์ A|256303090303|246|ม.3 ENT EXTRA|9|256303
# 662|ม.1-ม.2 BOOST อังกฤษ Level 1 |256303080601|240|ม.1-ม.2 ภาษาอังกฤษ|8|256303
# 602|ป.5 BOOST คณิต|256303050501|234|ป.5 กลุ่มวันเสาร์ ห้อง B|5|256303
# 610|ป.5 BOOST คณิต|256303050601|235|ป.5 กลุ่มวันอาทิตย์|5|256303
# 588|ป.4 BOOST สังคม|256303040405|230|ป.4 กลุ่มวันเสาร์|4|256303
# 609|ป.5 MASTER อังกฤษ|256303050703|248|ป.5 MASTER|5|256303
# 603|ป.5 BOOST วิทย์|256303050502|234|ป.5 กลุ่มวันเสาร์ ห้อง B|5|256303
# 590|ป.4 BOOST วิทย์|256303040502|231|ป.4 กลุ่มวันอาทิตย์|4|256303
# 620|ป.6 ENT ไทย|256303060405|236|ป.6 กลุ่มวันเสาร์|6|256303
# 661|ม.3 MASTER อังกฤษ|256303090503|247|ม.3 MASTER|9|256303
# 658|ม.3 ENT สังคม|256303090307|246|ม.3 ENT EXTRA|9|256303
# 663|ม.1-ม.2 BOOST อังกฤษ Level 2|256303080602|240|ม.1-ม.2 ภาษาอังกฤษ|8|256303
# 617|ป.6 ENT วิทย์|256303060402|236|ป.6 กลุ่มวันเสาร์|6|256303
# 586|ป.4 BOOST อังกฤษ|256303040403|230|ป.4 กลุ่มวันเสาร์|4|256303
# 596|ป.4 MASTER อังกฤษ|256303040603|232|ป.4 MASTER|4|256303
# 594|ป.4 MASTER คณิต|256303040601|232|ป.4 MASTER|4|256303
# 630|ม.1 BOOST คณิต B|256303070402|239|ม.1 BOOST |7|256303
# 639|ม.2 BOOST ไทย|256303080705|241|ม.2 BOOST |8|256303
# 657|ม.3 ENT ไทย|256303090306|246|ม.3 ENT EXTRA|9|256303
# 650|ม.2 SUPREME วิทย์|256303081004|243|ม.2 MASTER / SUPREME|8|256303
# 581|ป.3 BOOST วิทย์|256303030302|229|ป.3|3|256303
# 589|ป.4 BOOST คณิต|256303040501|231|ป.4 กลุ่มวันอาทิตย์|4|256303
# 606|ป.5 BOOST สังคม|256303050505|234|ป.5 กลุ่มวันเสาร์ ห้อง B|5|256303
# 626|ป.6 MASTER คณิต|256303060601|238|ป.6 MASTER|6|256303
# 664|ม.1-ม.2 BOOST อังกฤษ Level 3|256303080603|240|ม.1-ม.2 ภาษาอังกฤษ|8|256303
# 623|ป.6 ENT อังกฤษ|256303060503|237|ป.6 กลุ่มวันอาทิตย์|6|256303
# 580|ป.3 BOOST คณิต|256303030301|229|ป.3|3|256303
# 627|ป.6 MASTER วิทย์|256303060602|238|ป.6 MASTER|6|256303
# 599|ป.5 BOOST อังกฤษ|256303050403|233|ป.5 กลุ่มวันเสาร์ ห้อง A|5|256303
# 649|ม.2 SUPREME คณิต|256303081003|243|ม.2 MASTER / SUPREME|8|256303
# 591|ป.4 BOOST อังกฤษ|256303040503|231|ป.4 กลุ่มวันอาทิตย์|4|256303
# 669|ม.1 - ม.2 SUPREME อังกฤษ|256303080606|240|ม.1-ม.2 ภาษาอังกฤษ|8|256303
# 621|ป.6 ENT คณิต |256303060501|237|ป.6 กลุ่มวันอาทิตย์|6|256303
# 584|ป.4 BOOST คณิต|256303040401|230|ป.4 กลุ่มวันเสาร์|4|256303
# 632|ม.1 BOOST วิทย์ GG|256303070404|239|ม.1 BOOST |7|256303
# 604|ป.5 BOOST อังกฤษ|256303050503|234|ป.5 กลุ่มวันเสาร์ ห้อง B|5|256303
# 595|ป.4 MASTER วิทย์|256303040602|232|ป.4 MASTER|4|256303
# 585|ป.4 BOOST วิทย์|256303040402|230|ป.4 กลุ่มวันเสาร์|4|256303
# 597|ป.5 BOOST คณิต|256303050401|233|ป.5 กลุ่มวันเสาร์ ห้อง A|5|256303
# 618|ป.6 ENT อังกฤษ|256303060403|236|ป.6 กลุ่มวันเสาร์|6|256303
# 652|ม.3 ENT คณิต part2 - A|256303090301|246|ม.3 ENT EXTRA|9|256303
# 635|ม.2 BOOST คณิต A|256303080701|241|ม.2 BOOST |8|256303
# 660|ม.3 MASTER วิทย์|256303090502|247|ม.3 MASTER|9|256303
