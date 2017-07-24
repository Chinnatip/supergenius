class UserMailer < ApplicationMailer
  default from: 'feedback@supergeniusschool.com'

  def feedback_email(feedback,mailto)
    @mailto   = mailto
    @feedback = feedback
    mail(to: @mailto , subject: "[Feedback] จากผู้ปกครองน้อง#{feedback[:name]} รหัสนักเรียน#{feedback[:code]}")
  end
end
