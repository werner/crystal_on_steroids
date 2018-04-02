require "./spec_helper"

describe Number do
  describe "all bytes transformations" do
    it "transform 45 bytes to bytes" do
      45.bytes.should eq(45)
    end

    it "transform 4 kilobytes to bytes" do
      4.kilobytes.should eq(4096)
    end

    it "transform 5 megabytes to bytes" do
      5.megabytes.should eq(5_242_880)
    end

    it "transform 1 gigabyte to bytes" do
      1.gigabyte.should eq(1_073_741_824)
    end

    it "transforms 3 terabytes to bytes" do
      3.terabytes.should eq(3_298_534_883_328)
    end

    it "transforms 6 petabytes to bytes" do
      6.petabytes.should eq(6_755_399_441_055_744)
    end

    it "transforms 2 exabytes to bytes" do
      2.exabytes.should eq(2_305_843_009_213_693_952)
    end
  end
end
