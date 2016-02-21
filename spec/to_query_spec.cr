require "./spec_helper"

describe Object do
  describe "to_query" do
    it "returns the query string with a given key" do
      test = "Hello World!"
      test.to_query("greetings").should eq("greetings=Hello%20World%21")
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
      hash.to_query.should eq("name=David&nationality=Danish")
    end

    it "returns an url encode string for a hash with namespace" do
      hash = {name: "David", nationality: "Danish"}
      hash.to_query("user").should eq("user%5Bname%5D=David&user%5Bnationality%5D=Danish")
    end
  end
end
