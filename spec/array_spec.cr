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

  describe "rest" do
    it "returns the rest of elements" do
      array = [1, 2, 3, 4, 5]
      array.rest.should eq([2, 3, 4, 5])
    end
  end

  describe "split" do
    context "based on passed in value" do
      it "returns two array when occurring once in an array" do
        array = [1, 2, 3, 4, 5]

        array.split(3).should eq([[1, 2], [4, 5]])
      end

      it "returns three when occurring twice in an array" do
        array = [1, "one", :two, 2, :two, 3]

        array.split(:two).should eq([[1, "one"], [2], [3]])
      end
    end

    it "splits based on the divisibility by 3" do
      (1..10).to_a.split { |i| i % 3 == 0 }.should eq([[1, 2], [4, 5], [7, 8], [10]])
    end
  end
end
