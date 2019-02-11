require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
  	@user = User.create(email: "admin@admin.com", first_name: "admin", last_name: "root")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    describe "#first_name" do
      it "should not be valid without first_name" do
        bad_user = User.create(last_name: "root")
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:first_name)).to eq(true)
      end
    end

    describe "#last_name" do
      it "should not be valid without last_name" do
        bad_user = User.create(first_name: "admin")
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:last_name)).to eq(true)
      end
    end

    describe "#email" do
      it "should not be lower that 3 characters" do
        invalid_user = User.create(email: "admin@admin.com")
        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.include?(:email)).to eq(false)
      end
    end
  end

  context "associations" do

    describe "event" do
      it "should have_many events" do
        @event = Event.create(user: @user)
        expect(@user.events.include?(@event)).to eq(false)
      end
    end

  end



  context "public instance methods" do

    describe "#full_name" do

      it "should return a string" do
        expect(@user.first_name).to be_a(String)
      end
    end
  end
end