require "./spec_helper"

describe Array do
  describe "second, third, fourth, fifth" do
    it "returns the second index" do
      array = [2, 6, 7, 3]
      array.second.should eq(6)
    end

    it "returns the third index" do
      array = [2, 6, 7, 3]
      array.third.should eq(7)
    end

    it "returns the fourth index" do
      array = [2, 6, 7, 3]
      array.fourth.should eq(3)
    end

    it "returns the fifth index" do
      array = [2, 6, 7, 3, 9]
      array.fifth.should eq(9)
    end

    it "throws an error" do
      array = [] of Int32
      expect_raises IndexError do
        array.second.should eq(9)
      end
    end
  end
end
