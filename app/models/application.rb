class Application < ActiveRecord::Base

  mount_uploader :cv, CvUploader

  #validates :name, :grade, :speciality, :email, :phone_number, :date, :cv, presence: true

end
