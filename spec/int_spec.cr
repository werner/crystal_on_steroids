require "./spec_helper"

describe Int do
  describe "multiple_of?" do
    it "checks 10 is multiple of 2" do
      10.multiple_of?(2).should eq(true)
    end
    
    it "checks 6 is not multiple of 5" do
      6.multiple_of?(5).should eq(false)
    end
  end
end
