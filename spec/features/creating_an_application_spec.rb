require 'rails_helper'

RSpec.feature "Creating An Application", type: :feature do
  describe "User fills out application form with all required fields" do
    it "should save the application and send an email" do
      visit root_path
      expect(page).to have_content("Your Details")
      fill_in "application[name]", with: "Joe Bloggs"
      fill_in "application[grade]", with: "A+"
      fill_in "application[speciality]", with: "Blogging"
      fill_in "application[date]", with: "Next Tuesday"
      fill_in "application[email]", with: "joe@example.com"
      fill_in "application[phone_number]", with: "01482 666999"
      select "Doctors.net", from: "application[how_heard]"
      page.attach_file("application[cv]", File.join(Rails.root, "spec/support/cvs/not_a_cv.docx"))
      click_button "Create Application"

      expect(page).to have_content("Thank you for your application")
      expect(last_email.to).to include(site_email)
      expect(last_email.subject).to eq("Application form completed #{ site_name }")

      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end
  end

  #describe "User doesn't application form with all required fields" do
  #  it "should display errors" do
  #    visit root_path
  #    expect(page).to have_content("Your Details")
  #    click_button "Create Application"
  #    expect(page).to have_content("prevented your application from being sent")
  #  end
  #end
end
