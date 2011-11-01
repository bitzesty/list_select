# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "list_select/version"

Gem::Specification.new do |s|
  s.name        = "list_select"
  s.version     = ListSelect::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Dmitry Naumov"]
  s.email       = ["naumovmail@gmail.com"]
  s.homepage    = "http://github.com/bitzesty/list_select"
  s.summary     = %q{Localiazed select lists helper.}
  s.description = %Q{
    Provides a simple helper to get an HTML select list of any lists defined in your locales files.
    Has builtin lists for selecting countries, languages and more.
    Adds country_select helper to integrate with SimpleForm and Formtastic.
  }

  s.rubyforge_project = "list_select"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
