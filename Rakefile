require 'rake'
require 'rubygems'
require 'spec/rake/spectask'
require 'rake/rdoctask'
require 'rake/gempackagetask'

$LOAD_PATH.unshift File.dirname(__FILE__) + '/lib'

require 'spec'
require 'ean13'

desc "Default: run specs"
task :default => :spec

desc "Run all the specs for the notamock plugin."
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['--colour']
  t.rcov = true
  t.rcov_opts = ["--exclude \"spec/*,gems/*\""]
end

desc "Generate documentation for the notamock plugin."
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'EAN-13'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('MIT-LICENSE')
  rdoc.rdoc_files.include('CHANGELOG')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

PKG_NAME           = "ean13"
PKG_VERSION        = EAN13::Version::String
PKG_FILE_NAME      = "#{PKG_NAME}-#{PKG_VERSION}"
RUBY_FORGE_PROJECT = "yob-projects"

spec = Gem::Specification.new do |s|
  s.name              = PKG_NAME
  s.version           = PKG_VERSION
  s.summary           = "a (very) small library for working with EAN-13 codes"
  s.description       = "a (very) small library for working with EAN-13 codes"
  s.author            = "James Healy"
  s.email             = "jimmy@deefa.com"
  s.homepage          = "http://github.com/yob/ean13/tree/master"
  s.has_rdoc          = true
  s.rdoc_options     << "--title" << "EAN-13" <<
                        "--line-numbers"
  s.rubyforge_project = RUBY_FORGE_PROJECT
  s.add_dependency('san')
  s.test_files        = FileList["spec/**/*_spec.rb"]
  s.files             = FileList[
    "lib/**/*.rb",
    "MIT-LICENSE",
    "README.rdoc",
    "CHANGELOG"
  ]
end

Rake::GemPackageTask.new(spec) do |p|
  p.gem_spec = spec
  p.need_tar = false
  p.need_zip = false
end
