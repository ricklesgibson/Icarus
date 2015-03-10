require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  before(:each) do
    @user = User.new(email: 'ricklesgibson@gmail.com', password: '12345')
  end
  it "creates a new session" do
    visit '/sessions/new'
    within("#new_user") do
      fill_in 'Email', :with => @user.email
      fill_in 'Password', :with => "12345"
    end
    click_button "Log me in!"
    expect(session["user_id"]).to eq(@user.id.to_s)
  end
end
