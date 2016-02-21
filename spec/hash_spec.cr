require "./spec_helper"

describe Hash do
  describe "compact" do
    it "returns a hash with non nil values" do
      hash = { a: true, b: false, c: nil }
      hash.compact.should eq({ a: true, b: false })
      hash = { c: nil }
      hash.compact.should eq({} of Symbol => Nil)
    end

    it "returns the same modified hash compacted" do
      hash = { a: true, b: false, c: nil}
      hash.compact!
      hash.should eq({ a: true, b: false })
    end
  end
end
