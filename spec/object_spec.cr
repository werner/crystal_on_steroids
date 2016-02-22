require "./spec_helper"

describe Object do
  describe "blank?" do
    it "returns true for false value" do
      test = false
      test.blank?.should eq(true)
    end

    it "returns true for empty array and empty hash" do
      test = [] of Int32
      test.blank?.should eq(true)
      test = {} of Int32 => Int32
      test.blank?.should eq(true)
    end

    it "returns true for nil values" do
      test = nil
      test.blank?.should eq(true)
    end
  end

  describe "present?" do
    it "returns true for strings" do
      test = "hello world"
      test.present?.should eq(true)
    end

    it "returns true for numbers" do
      test = 54
      test.present?.should eq(true)
    end

    it "returns true for collections" do
      test = [4, 5]
      test.present?.should eq(true)
      test = {four: 4, five: 5}
      test.present?.should eq(true)
    end
  end

  describe "presence" do
    it "returns the int if present" do
      test = 45
      test.presence.should eq(45)
    end

    it "returns nil for nil object" do
      test = nil
      test.presence.should eq(nil)
    end
  end

  describe "in?" do
    it "returns true for int32 included in array" do
      array = [3, 4, 2, 7]
      4.in?(array).should eq(true)
    end

    it "returns false for an element not included" do
      array = [5, 7, 9, "hi"]
      "hello".in?(array).should eq(false)
    end
  end

  describe "presence_in" do
    it "returns the receiver when included" do
      array = [3, 4, 2, 7]
      4.presence_in(array).should eq(4)
    end

    it "returns nil when the receiver is not included" do
      params = {greetings: "hi", bucket_type: "other"}
      params[:bucket_type].presence_in(%w( project calendar )).should eq(nil)
    end
  end
end
