class Exam < ApplicationRecord

  def self.parse_score(text)
    result = []
    score = text.split(",").map{ |x| x.strip }
    score.each do |sc|
      if sc.present?
        scf     = sc.to_f rescue 0
        par_scf = if scf > 10 then 10 else scf end
        result << sc.to_f rescue 0
      else
        result << 0
      end
    end
    return result # score.to_json
  end

  def self.parse_score_with_period(text,period,type)
    result = []
    score = text.split(",").map{ |x| x.strip } rescue []
    p_spec = if type == 'mental' then period + 1 else period end
    p_spec.times do |i|
      if score[i].present?
        result << score[i].to_i rescue 0
      else
        result << 0
      end
    end
    return result # score.to_json
  end

  def self.total_score(score_array)
    result = 0
    score_array.each do |s|
      g = s.to_f rescue 0
      result += g
    end
    return result
  end


end
