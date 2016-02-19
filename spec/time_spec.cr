require "./spec_helper"

describe Time do
  describe "yesterday" do
    it "moves one day in the past from established date" do
      Time.new(2015, 8, 1, 14, 35, 0).prev_day.should eq(Time.new(2015, 7, 31, 14, 35, 0))
    end
  end

  describe "tomorrow" do
    it "moves one day in the future from established date" do
      Time.new(2015, 8, 1, 14, 35, 0).next_day.should eq(Time.new(2015, 8, 2, 14, 35, 0))
    end
  end
end
