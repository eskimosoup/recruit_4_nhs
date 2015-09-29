FactoryGirl.define do
  factory :applications do
    name "MyString"
    grade "MyString"
    speciality "MyString"
    email "MyString"
    phone_number "MyString"
    date "2015-08-25"
    additional_information "MyText"
    how_heard 'Doctors.net'
    cv { File.open(File.join(Rails.root, "spec/support/cvs/not_a_cv.docx"))}
  end

end
