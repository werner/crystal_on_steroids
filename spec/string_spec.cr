require "./spec_helper"

describe String do
  describe "blank?" do
    it "returns true for empty string" do
      test = " "
      test.blank?.should eq(true)
      test = ""
      test.blank?.should eq(true)
    end
  end

  describe "remove" do
    it "removes all ocurrences of the pattern" do
      test = "Hello World"
      test.remove(/Hello /).should eq("World")
    end
  end

  describe "truncate" do
    it "truncates a given text after a given size" do
      test = "Once upon a time in a world far far away"
      test.truncate(27).should eq("Once upon a time in a wo...")
    end

    it "truncates a text at a natural break" do
      test = "Once upon a time in a world far far away"
      test.truncate(27, { separator: " " }).should eq("Once upon a time in a...")
    end

    it "truncates and replace the last string" do
      test = "And they found that many people were sleeping better."
      test.truncate(25, { omission: "... (continued)" }).should eq("And they f... (continued)")
    end
  end

  describe "truncate" do
    it "truncates a text after a number of words" do
      test = "Once upon a time in a world far far away"
      test.truncate_words(4).should eq("Once upon a time...")
    end

    it "truncates passing a string :separator" do
      test = "Once<br>upon<br>a<br>time<br>in<br>a<br>world"
      test.truncate_words(5, { separator: "<br>" }).should eq("Once<br>upon<br>a<br>time<br>in...")
    end

    it "truncates with an omission string" do
      test = "And they found that many people were sleeping better."
      test.truncate_words(5, { omission: "... (continued)" }).should eq("And they found that many... (continued)")
    end
  end

  describe "squish" do
    it "squish all spaces in a sentence" do
      test = "  foo   bar    \n   \t   boo"
      test.squish.should eq("foo bar boo")
    end

    it "squish all spaces in a multiline sentence" do
      test = %{ Multi-line
                string }
      test.squish.should eq("Multi-line string")
    end
  end
end
