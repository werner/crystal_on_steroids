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

  describe "from" do
    it "returns elements from position in an array if it exists" do
      array = %w(a b c d)

      array.from(0).should eq(["a", "b", "c", "d"])
      array.from(2).should eq(["c", "d"])
      array.from(10).should eq([] of Array(String))
      %w().from(0).should eq([] of Array(String))
      array.from(-2).should eq(["c", "d"])
      array.from(-10).should eq([] of Array(String))
    end
  end

  describe "to" do
    it "returns elements to the position" do
      array = %w(a b c d)

      array.to(0).should eq(["a"])
      array.to(2).should eq(["a", "b", "c"])
      array.to(10).should eq(array)
      %w().to(0).should eq([] of String)
      array.to(-2).should eq(["a", "b", "c"])
      array.to(-10).should eq([] of String)
    end
  end

  describe "rest" do
    it "returns the rest of elements" do
      array = [1, 2, 3, 4, 5]
      array.rest.should eq([2, 3, 4, 5])
    end

    it "returns the rest when all items are the same" do
      array = [1, 1, 1, 1, 1]
      array.rest.should eq([1, 1, 1, 1])
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

  describe "in_groups" do
    it "should split as three arrays with nil for filler elements to match length" do
      array = %w(1 2 3 4 5 6 7 8 9 10)
      result = [["1", "2", "3", "4"],
                ["5", "6", "7", nil],
                ["8", "9", "10", nil]]

      array.in_groups(3).should eq(result)
    end

    it "should split as three arrays with filler elements to match length" do
      array = %w(1 2 3 4 5 6 7 8 9 10)
      result = [["1", "2", "3", "4"],
                ["5", "6", "7", "&nbsp;"],
                ["8", "9", "10", "&nbsp;"]]

      array.in_groups(3, "&nbsp;").should eq(result)
    end

    it "should split as three arrays with no filler elements" do
      array = %w(1 2 3 4 5 6 7 8 9 10)
      result = [["1", "2", "3", "4"],
                ["5", "6", "7"],
                ["8", "9", "10"]]

      array.in_groups(3, false).should eq(result)
    end
  end

  describe "slice" do
    it "should return element at index when only index position is passed" do
      array = %w(1 2 3 4 5 6 7 8 9 10)
      array_2 = [0, :one, "two"]

      array.slice(5).should eq(array[5])
      array_2.slice(1).should eq(array_2[1])
    end

    it "should return an array starting from index with elmelements " do
      array = %w(1 2 3 4 5 6 7 8 9 10)
      array_2 = [0, :one, "two"]

      array.slice(5, 5).should eq(%w(6 7 8 9 10))
      array_2.slice(1, 2).should eq([:one, "two"])
    end

    it "should return an array based on the range passed" do
      array = %w(1 2 3 4 5 6 7 8 9 10)
      array_2 = [0, :one, "two"]

      array.slice(5..10).should eq(%w(6 7 8 9 10))
      array_2.slice(1..2).should eq([:one, "two"])
    end
  end
end
