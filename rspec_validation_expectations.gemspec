Gem::Specification.new do |s|
  s.name     = "rspec_validation_expectations"
  s.version  = "0.5"
  s.date     = "2008-08-14"
  s.summary  = "Adds several handy expectations for testing ActiveRecord model validations."
  s.email    = "pelargir@gmail.com"
  s.homepage = "http://github.com/pelargir/rspec_validation_expectations"
  s.description = "Adds several handy expectations for testing ActiveRecord model validations."
  s.has_rdoc = true
  s.authors  = ["Matthew Bass"]
  s.files    = [
    "CHANGELOG",
    "MIT-LICENSE",
    "README",
    "Rakefile",
    "init.rb",
    "lib/rspec_validation_expectations.rb",
    "lib/rspec_validation_expectations/validation_expectations.rb",
    "lib/rspec_validation_expectations/association_expectations.rb",
    "lib/rspec_validation_expectations/other_expectations.rb",
    "lib/spec/rails/matchers/associations.rb",
    "rspec_validation_expectations.gemspec",
    "test/test_helper.rb"
    ]
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["README"]
end