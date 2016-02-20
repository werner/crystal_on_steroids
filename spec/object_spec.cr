require "./spec_helper"

describe Object do
  describe "blank?" do
    it "returns true for empty string" do
      test = ""
      test.blank?.should eq(true)
    end

    it "returns true for false value" do
      test = false
      test.blank?.should eq(true)
    end

    it "returns true for empty array and empty hash" do
      test = [] of Int32
      test.blank?.should eq(true)
      test = {} of Int32 => Int32
      test.blank?.should eq(true)
    end

    it "returns true for nil values" do
      test = nil
      test.blank?.should eq(true)
    end
  end
end
