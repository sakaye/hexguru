require 'spec_helper'

describe "User Pages" do

  subject { page }

  describe "Sign Up page" do
    before { visit signup_path }
    let(:submit) { "Sign up" }

    it { should have_content('Sign Up') }

    describe "with invalid information" do
      it "should not create a new user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Username",  with: "Example"
        fill_in "Email",  with: "Example@place.com"
        fill_in "Password",  with: "foobar"
        fill_in "Confirmation",  with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

end