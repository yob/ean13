$LOAD_PATH << File.dirname(__FILE__) + "/../lib"

require 'spec'
require 'ean13'

describe "The EAN13 class" do
  it "should identify a valid EAN13" do
    expect(EAN13.new("9781843549161").valid?).to be_truthy
  end

  it "should identify a valid EAN13" do
    expect(EAN13.valid?("9781843549161")).to be_truthy
    expect(EAN13.valid?(9781843549161)).to   be_truthy
    expect(EAN13.valid?("9790702228727")).to be_truthy
    expect(EAN13.valid?("9790702228727")).to be_truthy
    expect(EAN13.valid?("0602498351321")).to be_truthy
  end
  
  it "should identify an invalid EAN13" do
    expect(EAN13.valid?(nil)).to              be_falsey
    expect(EAN13.valid?("978184354916")).to   be_falsey
    expect(EAN13.valid?(Array)).to            be_falsey
    expect(EAN13.valid?(Array.new)).to        be_falsey
    expect(EAN13.valid?("9781843549162")).to  be_falsey
  end

  it "should identify a bookland EAN13" do
    expect(EAN13.new("9781843549161").bookland?).to be_truthy
    expect(EAN13.new("9791843549160").bookland?).to be_truthy
    expect(EAN13.new("9791843549161").bookland?).to be_falsey
    expect(EAN13.new("sdw32423").bookland?).to      be_falsey
    expect(EAN13.new("632737715836").bookland?).to  be_falsey
  end

  it "should calculate a EAN13 check digit correctly" do
    expect(EAN13.complete("978184354916")).to eql("9781843549161")
    expect(EAN13.complete(978184354916)).to   eql("9781843549161")
  end

  it "should convert to a UPC correctly" do
    expect(EAN13.new("9781843549161").to_upc).to be_nil
    expect(EAN13.new("0632737715836").to_upc).to eql("632737715836")
  end

  it "should convert to a GTIN-14 correctly" do
    expect(EAN13.new("9781843549161").to_gtin).to eql("09781843549161")
    expect(EAN13.new("0632737715836").to_gtin).to eql("00632737715836")
  end
end
