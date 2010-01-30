require 'rake'

Gem::Specification.new do |s|
  s.name     = "rspec_validation_expectations"
  s.version  = "0.5"
  s.date     = "2008-08-14"
  s.summary  = "Adds expectations for testing ActiveRecord model validations."
  s.email    = "pelargir@gmail.com"
  s.homepage = "http://github.com/pelargir/rspec_validation_expectations"
  s.description = "Adds several handy expectations for testing ActiveRecord model validations, similar to what Shoulda provides."
  s.rubyforge_project = "rspec_validation_expectations"
  s.has_rdoc = true
  s.authors  = ["Matthew Bass"]
  s.files    = FileList["[A-Z]*", "init.rb", "{lib,spec}/**/*.{rb,xml}"]
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["README"]
  s.add_development_dependency "activesupport", "2.3.5"
  s.add_development_dependency "activerecord", "2.3.5"
  s.add_development_dependency "validation_reflection", "0.3.5"
end
