require 'rails_helper'
require 'spec_helper'



RSpec.describe Pilot, type: :model do
  
  describe "Pilot Validation" do
  	before (:each) do
  	  @pilot = Pilot.create
  	end

  	it "has a valid factory" do 
  	  expect(FactoryGirl.create(:pilot)).to be_valid
  	end

  	it "is invalid without a firstname" do
  	  expect(FactoryGirl.build(:pilot, first_name: :nil)).to_not be_valid
  	end

  	it "is invalid without a lastname" do 
  	  expect(FactoryGirl.build(:pilot, last_name: :nil)).to_not be_valid
  	end

  	it "is invalid without a password" do
      expect(FactoryGirl.build(:pilot, password: nil)).to_not be_valid
    end

    it "is invalid without an email" do
      expect(FactoryGirl.build(:pilot, email: nil)).to_not be_valid
    end
    
    it "is invalid without driverslicense" do
      expect(FactoryGirl.build(:pilot, drivers_license: nil)).to_not be_valid
    end

    it "is invalid without insurance" do
      expect(FactoryGirl.build(:pilot, insurance: nil)).to_not be_valid
    end
  end

end

