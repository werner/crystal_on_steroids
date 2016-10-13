require "./spec_helper"
require "json"
require "yaml"

describe Hash do
  describe "dig" do
    it "search for a value recursively" do
      h = {foo: {bar: {baz: 5}}}
      h.dig(:foo, :bar, :baz).should eq(5)
    end
    
    it "returns nil when there is no value" do
      h = {foo: {bar: {baz: 5}}}
      h.dig(:foo, :blah).should be_nil
    end
  end
end

describe JSON::Any do
  describe "dig" do
    it "search for a value in a json object" do
      data = JSON.parse(%({"access": {"name": {"greetings": "hi" }, "speed": 43}}))
      data.dig("access", "name", "greetings").should eq("hi")
    end

    it "returns nil when there is no value" do
      data = JSON.parse(%({"access": {"name": {"greetings": "hi" }, "speed": 43}}))
      data.dig("access", "name", "farewell").should eq(nil)
    end
  end
end

describe YAML::Any do
  describe "dig" do
    data = YAML.parse <<-END
             ---
             country:
               city:
                 age:
                   - 49
             END

    it "search for a value in a yaml object" do
      data.dig("country", "city", "age").should eq(["49"])
    end

    it "returns nil when there is no value" do
      data.dig("country", "city", "color").should eq(nil)
    end
  end
end

describe "Object" do
  describe "dig?" do
    it "returns nil when object does not implements #[]?" do
      data = 34
      data.dig?(45).should eq(nil)
    end

    it "behaves the same as dig" do
      data = JSON.parse(%({"access": {"name": {"greetings": "hi" }, "speed": 43}}))
      data.dig?("access", "name", "greetings").should eq("hi")
    end

    it "digs on an array" do
      data = [[1], [2, 3], [4, [5]]]
      data.dig?(2, 1, 0).should eq(5)
    end
  end
end
