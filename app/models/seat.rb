class Seat < ApplicationRecord

  def self.find_student(key)
    return self.where(classroom: key).count
  end

end
