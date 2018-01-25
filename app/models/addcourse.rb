class Addcourse < ApplicationRecord
  def self.parse_type(type)
    if type == 'extra'
      return "นัดเพิ่ม"
    else
      return "นัดเเก้"
    end
  end

  def self.details(obj)
    name = Course.where(session_id: obj[:course]).first[:name] rescue ''
    return {
      name: name ,
      type: parse_type(obj[:add_type]),
      desc: obj[:desc].html_safe ,
      desc_abbrev: obj[:desc][0..120].html_safe
    }
  end
end
