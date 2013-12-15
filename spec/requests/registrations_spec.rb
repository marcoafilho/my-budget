require 'spec_helper'

describe "Registrations" do

  subject { page }

  describe "sign up" do
    before { visit root_path }

    let(:submit) { "Sign up" }

    describe "with valid information" do
      before do
        fill_in 'user_name', with: "Peter Parker"
        fill_in 'user_email', with: "peter.parker@marvel.com"
        fill_in 'user_password', with: "mArYjAnE"
      end

      it "should redirect to Dashboard" do
        click_button submit
        current_path.should == dashboard_path
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end

    describe "with invalid information" do
      before do
        fill_in 'user_name', with: ""
        fill_in 'user_email', with: ""
        fill_in 'user_password', with: ""
      end

      it "should redirect root path" do
        click_button submit
        current_path.should == '/registrations'
      end

      it "should display first error only" do
        click_button submit
        expect(page).to have_content("Name can't be blank")
        expect(page).to_not have_content("Email can't be blank")
      end

      it "should create a user" do
        expect { click_button submit }.to_not change(User, :count)
      end
    end
  end
end
