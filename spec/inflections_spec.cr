require "./spec_helper"

describe Int do
  describe "ordinal" do
    it "returns the ordinal suffix value for 1" do
      1.ordinal.should eq("st")
    end

    it "returns the ordinal suffix value for 2" do
      2.ordinal.should eq("nd")
    end

    it "returns the ordinal suffix value for 1003" do
      3.ordinal.should eq("rd")
    end
    
    it "returns the ordinal suffix value for 11" do
      11.ordinal.should eq("th")
    end
  end

  describe "ordinalize" do
    it "returns the ordinalize value for 1002" do
      1002.ordinalize.should eq("1002nd")
    end
  end
end
