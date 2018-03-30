require "./spec_helper"

describe Regex do
  describe "match?" do
    it "returns true for ab from abc" do
      /ab/.match?("abc").should eq(true)
    end

    it "returns false for ho from world" do
      /ho/.match?("world").should eq(false)
    end
  end
end
