require 'rails_helper'

RSpec.describe Application, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:grade) }
    it { should validate_presence_of(:speciality) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone_number) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:cv) }
  end
end
