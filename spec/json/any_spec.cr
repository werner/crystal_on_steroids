require "../spec_helper"
require "json"

describe JSON::Any do
  describe "reduce" do
    it "sums all values from a json Hash type" do
      data = JSON.parse(%({"access": [{"name": "mapping", "speed": 43}, {"name": "any", "speed": 10}]}))
      data["access"].reduce(0) do |acc, item, value|
        item = item as Hash(String, JSON::Type)
        acc += item["speed"] as Int64
      end.should eq(53)
    end

    it "sums all values from array" do
      data = JSON.parse(%([1, 2, 3, 4]))
      data.reduce(0) do |acc, item|
        acc += item as Int64
      end.should eq(10)
    end

    it "throws an error" do
      data = JSON.parse("334")
      expect_raises do
        data.reduce {}
      end
    end
  end
end
