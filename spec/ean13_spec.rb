$LOAD_PATH << File.dirname(__FILE__) + "/../lib"

require 'spec'
require 'ean13'

describe "The EAN13 class" do
  it "should identify a valid EAN13" do
    EAN13.new("9781843549161").valid?.should be_true
  end

  it "should identify a valid EAN13" do
    EAN13.valid?("9781843549161").should be_true
    EAN13.valid?(9781843549161).should   be_true
    EAN13.valid?("9790702228727").should be_true
    EAN13.valid?("9790702228727").should be_true
    EAN13.valid?("0602498351321").should be_true
  end
  
  it "should identify an invalid EAN13" do
    EAN13.valid?(nil).should              be_false
    EAN13.valid?("978184354916").should   be_false
    EAN13.valid?(Array).should            be_false
    EAN13.valid?(Array.new).should        be_false
    EAN13.valid?("9781843549162").should  be_false
  end

  it "should calculate a EAN13 check digit correctly" do
    EAN13.complete("978184354916").should eql("9781843549161")
    EAN13.complete(978184354916).should   eql("9781843549161")
  end

  it "should convert to a UPC correctly" do
    EAN13.new("9781843549161").to_upc.should be_nil
    EAN13.new("0632737715836").to_upc.should eql("632737715836")
  end

  it "should convert to a GTIN-14 correctly" do
    EAN13.new("9781843549161").to_gtin.should eql("09781843549161")
    EAN13.new("0632737715836").to_gtin.should eql("00632737715836")
  end

  it "should recognise the presence of an embedded SAN" do
    EAN13.new("0799999013725").san?.should be_true
    EAN13.new("5030670159260").san?.should be_true
    EAN13.new("0632737715836").san?.should be_false
  end

  it "should convert to a SAN correctly" do

    begin
      require 'san'
    rescue LoadError
      warn "WARNING: can't test EAN13#to_san, san library not available"
    end

    if Kernel.const_defined?("SAN")
      EAN13.new("0799999013725").to_san.should eql("9013725")
      EAN13.new("5030670159260").to_san.should eql("0159263")
      EAN13.new("0632737715836").to_san.should be_nil
    end
  end
end
