require 'spec_helper'

describe "LoginTests" do
  before :each do
    @user = create(:user, :profile => create(:profile)) 
  end

  it "Logs in user and gives them a session id" do
   visit root_path
   should have_button('Login')
   find('#wrap').click_link('Login')
   within('#login') do
     fill_in "username or email", :with => @user.username 
     fill_in "password", :with => @user.password 
     click_button('Login')
   end 
   should have_content('Home')
  end

  it "Logs in user with a bad password and gives them an error" do
   visit root_path
   should have_button('Login')
   find('#wrap').click_link('Login')
   within('#login') do
     fill_in "username or email", :with => @user.username 
     fill_in "password", :with => "bad_password" 
     click_button('Login')
   end 

  end
end
