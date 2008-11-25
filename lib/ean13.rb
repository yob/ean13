require 'rubygems'
require 'san'

class EAN13

  class Version #:nodoc:
    Major = 1
    Minor = 1
    Tiny  = 0

    String = [Major, Minor, Tiny].join('.')
  end

  def initialize(str)
    @number = str.to_s
  end

  def valid?
    EAN13.valid? @number
  end

  def self.valid?(ean)
    ean = ean.to_s
    ean.length == 13 && ean == EAN13.complete(ean[0,12])
  end

  # Purely for generating new ean numbers
  def self.complete(twelve)
    twelve = twelve.to_s
    return nil unless twelve.length == 12 && twelve.match(/\d{11}/)

    arr = (0..11).to_a.collect do |i|
      if (i+1).even?
        twelve[i,1].to_i * 3
      else
        twelve[i,1].to_i
      end
    end
    sum = arr.inject { |sum, n| sum + n }
    remainder = sum % 10
    if remainder == 0
      check = 0
    else
      check = 10 - remainder
    end

    twelve + check.to_s
  end

  # Returns true if this EAN has an embedded SAN
  #
  # For more info on SANs, see 
  # http://www.bowker.com/index.php/component/content/article/3
  #
  def san?
    return nil unless valid?

    prefix = @number.to_s[0,6]
    if prefix == "079999" || prefix == "503067"
      true
    else
      false
    end
  end

  # convert this EAN to a SAN. returns nil if the EAN doesn't contain
  # an embedded SAN.
  #
  def to_san
    return nil unless san?
    SAN.complete(@number[6,6])
  end

  def to_gtin
    return nil unless self.valid?
    "0#{@number}"
  end

  def to_upc
    return nil unless self.valid?
    return nil unless @number[0,1] == "0"
    @number[1,12]
  end
end
