require 'rails_helper'
require 'spec_helper'



RSpec.describe Owner, type: :model do
  
  describe "Owner validation" do
  	before (:each) do
  	  @owner = Owner.create
  	end

  	it "has a valid factory" do 
  	  expect(FactoryGirl.create(:owner)).to be_valid
  	end

  	it "is invalid without a firstname" do
  	  expect(FactoryGirl.build(:owner, first_name: :nil)).to_not be_valid
  	end

  	it "is invalid without a lastname" do 
  	  expect(FactoryGirl.build(:owner, last_name: :nil)).to_not be_valid
  	end

  	it "is invalid without a password" do
      expect(FactoryGirl.build(:owner, password: nil)).to_not be_valid
    end

    it "is invalid without an email" do
      expect(FactoryGirl.build(:owner, email: nil)).to_not be_valid
    end

    it "is invalid without insurance" do
      expect(FactoryGirl.build(:owner, insurance: nil)).to_not be_valid
    end

    it "is invalid without carID" do
      expect(FactoryGirl.build(:owner, car_id: nil)).to_not be_valid
    end

  end



end
