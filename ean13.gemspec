Gem::Specification.new do |spec|
  spec.name = "ean13"
  spec.version = "2.0.1"
  spec.summary = "a (very) small library for working with EAN-13 codes"
  spec.description = "a (very) small library for working with EAN-13 codes"
  spec.license = "MIT"
  spec.author = "James Healy"
  spec.email = "jimmy@deefa.com"
  spec.homepage = "http://github.com/yob/ean13"
  spec.rdoc_options << "--title" << "EAN-13" << "--line-numbers"

  spec.required_ruby_version = ">=1.9.3"

  spec.test_files = Dir.glob("spec/**/*_spec.rb")
  spec.files = Dir.glob("lib/**/*.rb") + ["MIT-LICENSE", "README.markdown", "CHANGELOG" ]

  spec.add_development_dependency("rake")
  spec.add_development_dependency("rspec", "~> 3.0")
end
