require "./spec_helper"

describe Object do
  describe "to_query" do
    it "returns the query string with a given key" do
      test = "Hello World!"
      test.to_query("greetings").should eq("greetings=Hello%20World%21")
    end

    it "returns %E2%AC%A4 from ⬤ " do
      test = "⬤"
      test.to_query("data").should eq("data=%E2%AC%A4")

    end
  end
end

describe Array do
  describe "to_param" do
    it "display an array as elements joined by a slash" do
      array = ["user", 1, "create"]
      array.to_param.should eq("user/1/create")
    end
  end

  describe "to_query" do
    it "display an array as an url_encode string" do
      array = ["michael", "jhon"]
      array.to_query("user").should eq("user%5B%5D=michael&user%5B%5D=jhon")
    end
  end
end

describe Hash do
  describe "to_query" do
    it "returns an url encode string for a hash without namespace" do
      hash = {name: "David", nationality: "Danish"}
      hash.to_query.should eq("%7Bname%3A%20%22David%22%2C%20nationality%3A%20%22Danish%22%7D")
    end

    it "returns an url encode string for a hash with namespace" do
      hash = {name: "David", nationality: "Danish"}
      hash.to_query("user").should eq("user=%7Bname%3A%20%22David%22%2C%20nationality%3A%20%22Danish%22%7D")
    end
  end
end
