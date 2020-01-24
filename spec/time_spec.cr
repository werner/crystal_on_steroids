require "./spec_helper"

describe Time do
  describe "yesterday" do
    it "moves one day in the past from established date" do
      Time.local(2015, 8, 1, 14, 35, 0).prev_day.should eq(Time.local(2015, 7, 31, 0, 0, 0))
    end
  end

  describe "tomorrow" do
    it "moves one day in the future from established date" do
      Time.local(2015, 8, 1, 14, 35, 0).next_day.should eq(Time.local(2015, 8, 2, 0, 0, 0))
    end
  end

  describe "today?" do
    it "returns true for today? method" do
      Time.local.today?.should eq(true)
    end
  end

end
