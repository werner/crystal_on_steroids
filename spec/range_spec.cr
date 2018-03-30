require "./spec_helper"

describe Range do
  describe "overlaps?" do
    it "returns true when 1..5 overlaps 4..6" do
      (1..5).overlaps?(4..6).should eq(true)
    end

    it "returns false when 1..5 does not overlaps 7..9" do
      (1..5).overlaps?(7..9).should eq(false)
    end
  end
end
