require "./spec_helper"

describe Enumerable do
  describe "blank?" do
    it "returns true for empty array and empty hash" do
      test = [] of Int32
      test.blank?.should eq(true)
      test = {} of Int32 => Int32
      test.blank?.should eq(true)
    end
  end

  describe "exactly?" do
    it "returns true for even elements in array [1, 2, 3, 4]" do
      [1, 2, 3, 4].exactly?(2, &.even?).should eq(true)
    end

    it "returns false for no elements in block" do
      [1, 2, 3, 4].exactly?(1) { |n| n > 5 }.should eq(false)
    end
  end

  describe "many" do
    it "returns true if there are many elements in array" do
      array = [1, 2, 3]
      array.many?.should eq(true)
    end

    it "returns false because there's only one element or none" do
      array = [1]
      array.many?.should eq(false)
      array = [] of Int32
      array.many?.should eq(false)
    end

    it "returns true because it satisfied the block condition" do
      array = [1, 2, 3, 4]
      array.many? { |item| item * 2 > 5 }
    end

    it "returns false because it does not satisfy the block condition" do
      array = [1, 2, 3, 4]
      array.many? { |item| item == 65 }
    end
  end

  describe "pluck" do
    it "extract name values" do
      array = [{id: 1, name: "James"}, {id: 2, name: "Jhon"}]
      array.pluck(:name).should eq(["James", "Jhon"])
    end

    it "extracts several key values" do
      array = [{id: 1, name: "James", age: 20}, {id: 2, name: "Jhon", age: 30}]
      array.pluck(:name, :age).should eq([{"James", 20}, {"Jhon", 30}])
    end

    it "throws an error if any key does not exists" do
      array = [{id: 1, name: "James", age: 20}, {id: 2, name: "Jhon", age: 30}]
      expect_raises KeyError do
        array.pluck(:name, :age, :color)
      end
    end

    it "throws an error when key does not exists" do
      array = [{id: 1, name: "James", age: 20}, {id: 2, name: "Jhon", age: 30}]
      expect_raises KeyError do
        array.pluck(:color)
      end
    end

    it "throws an error when many key does not exists" do
      array = [{id: 1, name: "James", age: 20}, {id: 2, name: "Jhon", age: 30}]
      expect_raises KeyError do
        array.pluck(:color, :height)
      end
    end
  end

  describe "pluck?" do
    it "extract name values" do
      array = [{id: 1, name: "James"}, {id: 2, name: "Jhon"}]
      array.pluck?(:name).should eq(["James", "Jhon"])
    end

    it "extracts several key values" do
      array = [{id: 1, name: "James", age: 20}, {id: 2, name: "Jhon", age: 30}]
      array.pluck?(:name, :age).should eq([{"James", 20}, {"Jhon", 30}])
    end

    it "returns nil if any key does not exists" do
      array = [{id: 1, name: "James", age: 20}, {id: 2, name: "Jhon", age: 30}]
      array.pluck?(:name, :age, :color).should eq([{"James", 20, nil}, {"Jhon", 30, nil}])
    end

    it "returns nil when key does not exists" do
      array = [{id: 1, name: "James", age: 20}, {id: 2, name: "Jhon", age: 30}]
      array.pluck?(:color).should eq([] of Int32)
    end

    it "returns nil when many key does not exists" do
      array = [{id: 1, name: "James", age: 20}, {id: 2, name: "Jhon", age: 30}]
      array.pluck?(:color, :height).should eq([{nil, nil}, {nil, nil}])
    end
  end

  describe "excludes?" do
    it "returns true if object is not in the array" do
      array = [1, 2, 3, 4]
      array.excludes?(5).should eq(true)
    end

    it "returns false if object is in the array" do
      array = [1, 2, 3, 4]
      array.excludes?(3).should eq(false)
    end
  end

  describe "without" do
    it "excludes a group of items from the array" do
      array = [1, 2, 3, 4, 5]
      array.without(3, 5).should eq([1, 2, 4])
    end
  end

  describe "avg" do
    it "calculates the average of a numeric collection" do
      array = [1, 2, 3, 4, 5]
      array.avg.should eq(3)
    end
  end
end
