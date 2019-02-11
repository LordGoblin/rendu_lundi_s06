require 'rails_helper'

RSpec.describe Event, type: :model do

  before(:each) do
    @user = User.create(email: "admin@admin.com", first_name: "admin", last_name: "root")
    puts @user.id
  	@event = Event.create(start_date: "2019/02/15", duration: "60", title: "blablabla", description: "blaehgmwdjmdwkgbmjb<mdwkbgmbsxhtgblablablabla", price: "25", location: "lille", user_id: User.last.id)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@event).to be_a(Event)
      expect(@event).to be_valid
    end

    describe "#title" do
      it "should not be valid without title" do
        bad_event = Event.create(duration: "60")
        expect(bad_event).not_to be_valid
        expect(bad_event.errors.include?(:title)).to eq(true)
      end
    end

    describe "#last_name" do
      it "should not be valid without last_name" do
        bad_event = Event.create(title: "blablabla")
        expect(bad_event).not_to be_valid
        expect(bad_event.errors.include?(:description)).to eq(true)
      end
    end

    describe "#email" do
      it "should not be lower that 3 characters" do
        invalid_event = Event.create(title: "blablabla")
        expect(invalid_event).not_to be_valid
        expect(invalid_event.errors.include?(:title)).to eq(false)
      end
    end
  end

  context "associations" do

    describe "event" do
      it "should have_many events" do
        @attendance = Attendance.create(event: @event)
        expect(@event.attendances.include?(@attendance)).to eq(false)
      end
    end

  end



  context "public instance methods" do

    describe "#full_name" do

      it "should return a string" do
        expect(@event.title).to be_a(String)
      end
    end
  end
end