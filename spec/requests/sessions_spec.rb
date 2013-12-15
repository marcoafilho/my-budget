require 'spec_helper'

describe "Sessions" do
  describe "sign in" do
    before { visit root_path }

    let(:submit) { "Log in" }
    let(:user) { FactoryGirl.create(:user) }

    describe "with valid information" do
      before do
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
      end

      it "should redirect to Dashboard" do
        click_button submit
        current_path.should == dashboard_path
      end

      it "should have a sign out button" do
        click_button submit
        expect(page).to have_content "Sign out"
      end
    end

    describe "with invalid information" do
      before do
        fill_in 'email', with: user.email
        fill_in 'password', with: (user.password + "1")
      end

      it "should remain on root path" do
        click_button submit
        current_path.should == "/login"
      end

      it "should display error message" do
        click_button submit
        expect(page).to have_content "Invalid email and password combination."
      end
    end
  end

  describe "sign out" do
    before do 
      visit root_path
    end

    it "should redirect to root path" do
      expect(page).to have_content "Log in"
    end
  end
end
