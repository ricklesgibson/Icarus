require 'rails_helper'
require 'spec_helper'



RSpec.describe User, type: :model do

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

 it "saves user in the database" do
  # expect(FactoryGirl.create(:user)).to be_valid
   FactoryGirl.create(:user)
   last_user = User.last.id
   FactoryGirl.create(:user)
  expect(User.last.id).to eq(last_user + 1)
  end

end
