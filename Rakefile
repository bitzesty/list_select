require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the list_select plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the list_select plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ListSelect'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "list_select"
    gem.summary = %Q{Localiazed select lists helper.}
    gem.description = %Q{
      Provides a simple helper to get an HTML select list of any lists defined in your locales files.
      Has builtin lists for selecting countries, languages and more.
      Adds country_select helper to integrate with SimpleForm and Formtastic.
    }
    gem.email = "naumovmail@gmail.com"
    gem.homepage = "http://github.com/bitzesty/list_select"
    gem.authors = ["Dmitry Naumov"]
    gem.files =  FileList["[A-Z]*(.rdoc)", "{generators,lib}/**/*", "init.rb"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end