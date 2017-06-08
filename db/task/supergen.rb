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
    email: 'chin@kohlife.com',
    name:  'Zinny',
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
