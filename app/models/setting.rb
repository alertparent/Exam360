class Setting < ActiveRecord::Base
  attr_accessible :allow_examinee_registration, :confirm_exam, :datetime_format, :locale, :show_hint_to_examinee
  
end
