require "../spec_helper"
require "yaml"

describe YAML::Any do
  describe "reduce" do
    data = YAML.parse <<-END
             ---
             country:
               city:
                 age:
                   - 23
                   - 49
             END

    it "sums all values from a yaml type" do
      data["country"]["city"]["age"].reduce(0) do |acc, item|
        acc += (item as String).to_i
      end.should eq(72)
    end

    it "concat all values from a yaml type" do
      data.reduce("test") do |acc, item, value|
        acc = "#{acc} - #{item} - #{value}"
      end.should eq("test - country")
    end
  end

end
