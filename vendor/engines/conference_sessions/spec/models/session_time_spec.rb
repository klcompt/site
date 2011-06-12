require 'spec_helper'

describe SessionTime do
  its "title is empty if start or end time are undefined" do
    SessionTime.new.title.should eq('')
  end

  its "title contains start and end time" do
    Factory(:session_time).title.should eq('Tuesday from 12:30 to 01:30 PM')
  end

  it "is invalid without start_time" do
    SessionTime.new.should_not be_valid
  end

  it "is invalid if both duration_hours and duration_minutes are zero" do
    SessionTime.new(:start_time => DateTime.now).should_not be_valid
  end

  it "is valid if start_time and duration_hours are defined" do
    SessionTime.new(:start_time => DateTime.now, :duration_hours => 1).should be_valid
  end

  it "is valid if start_time and duration_minutes are defined" do
    SessionTime.new(:start_time => DateTime.now, :duration_minutes => 1).should be_valid
  end

  it "is valid if start_time, duration_hours, and duration_minutes are non-zero" do
    SessionTime.new(:start_time => DateTime.now, :duration_hours => 1, :duration_minutes => 1).should be_valid
  end

  context "#current_year" do
    it "only includes session times from this year" do
      current_year_time = Factory(:session_time)
      Factory(:session_time, :start_time => DateTime.parse('July 6, 1971, 12:00 PM'))
      SessionTime.current_year.should == [current_year_time]
    end
  end
end
