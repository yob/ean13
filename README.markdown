A small class for generating and validating EAN-13's, the 13 digit codes found
on many products sold around the world.

# Installation

    gem install ean13

# Usage

    EAN13.new("0632737715836").valid?
    => true

    EAN13.valid?("0632737715836")
    => true

    EAN13.valid?("0632737715837")
    => false

    EAN13.complete("063273771583")
    => "0632737715836"

    EAN13.new("0632737715836").to_upc
    => "632737715836"

    EAN13.new("0632737715836").to_gtin
    => "00632737715836"

# Further Reading

- http://en.wikipedia.org/wiki/European_Article_Number

# Contributing

Source code is publicly available @ http://github.com/yob/ean13. Patches
welcome, preferably via a git repo I can pull from.
