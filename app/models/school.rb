class School < ApplicationRecord

  def self.count_all
    return self.all.count
  end

end
