require "rake"
require "spec/rake/spectask"

task :default => :spec

Spec::Rake::SpecTask.new do |spec|
  spec.spec_files = FileList["spec/**/*_spec.rb"]
  spec.spec_opts << "--color"
  spec.libs += ["lib", "spec"]
  spec.rcov = true
  spec.rcov_opts = ["--exclude", "spec/**/*"]
  spec.rcov_dir = "rcov"
end
