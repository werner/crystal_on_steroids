require "./spec_helper"

describe Object do
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
