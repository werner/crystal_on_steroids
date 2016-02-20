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

  describe "present?" do
    it "returns true for strings" do
      test = "hello world"
      test.present?.should eq(true)
    end

    it "returns true for numbers" do
      test = 54
      test.present?.should eq(true)
    end

    it "returns true for collections" do
      test = [4, 5]
      test.present?.should eq(true)
      test = {four: 4, five: 5}
      test.present?.should eq(true)
    end
  end
end
