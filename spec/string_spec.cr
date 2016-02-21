require "./spec_helper"

describe String do
  describe "blank?" do
    it "returns true for empty string" do
      test = " "
      test.blank?.should eq(true)
      test = ""
      test.blank?.should eq(true)
    end
  end
end
