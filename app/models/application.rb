class Application < ActiveRecord::Base

  mount_uploader :cv, CvUploader

  #validates :name, :grade, :speciality, :email, :phone_number, :date, :cv, presence: true

  HOW_HEARD = ['Doctors.net', 'BMJ.com', 'Facebook', 'LinkedIn', 'Other']
end
