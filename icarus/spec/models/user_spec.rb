require 'rails_helper'
require 'spec_helper'



RSpec.describe User, type: :model do

  describe "User Validation" do
    before (:each) do
      @user = User.create
    end
   it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
   end

   it "is invalid without a firstname" do
    expect(FactoryGirl.build(:user, first_name: nil)).to_not be_valid
   end

   it "is invalid without a lastname" do
    expect(FactoryGirl.build(:user, last_name: nil)).to_not be_valid
   end

   it "is invalid without a password" do
    expect(FactoryGirl.build(:user, password: nil)).to_not be_valid
   end

   it "is invalid without an email" do
    expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
   end

   

 end

end

