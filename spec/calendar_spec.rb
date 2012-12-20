require "rspec"
require 'calendar'

describe Calendar do

  subject {  Object.new.extend Calendar }

  it "should calculate leap years correctly" do
    subject.leap_year?(1900).should be_false
    subject.leap_year?(2000).should be_true
    subject.leap_year?(4).should be_true
    subject.leap_year?(5).should be_false
  end

  it "should calculate days in a month correctly" do
    subject.days_in_month(1960, 1).should == 31
    subject.days_in_month(1960, 2).should == 29
    subject.days_in_month(1961, 2).should == 28
    subject.days_in_month(1961, 3).should == 31
    subject.days_in_month(1961, 4).should == 30
    subject.days_in_month(1961, 5).should == 31
    subject.days_in_month(1961, 6).should == 30
    subject.days_in_month(1961, 7).should == 31
    subject.days_in_month(1961, 8).should == 31
    subject.days_in_month(1961, 9).should == 30
    subject.days_in_month(1961, 10).should == 31
    subject.days_in_month(1961, 11).should == 30
    subject.days_in_month(1961, 12).should == 31
  end
end