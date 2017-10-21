require 'rake'

task :school_name_strip => :environment do
  puts "school stripper >>>"
  School.all.each do |sc|
    sc[:name] = sc[:name].strip
    puts sc[:name]
    sc.save
  end
end
