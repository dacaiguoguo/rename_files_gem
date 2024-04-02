# frozen_string_literal: true

require_relative "lib/rename_files_gem/version"

Gem::Specification.new do |spec|
  spec.name = "rename_files_gem"
  spec.version = RenameFilesGem::VERSION
  spec.authors = ["dacaiguoguo"]
  spec.email = ["dacaiguoguo@163.com"]

  spec.summary = "A Ruby Gem to rename files based on specific patterns within a directory."
  spec.description = "This Gem provides functionality to recursively rename files in a given directory, applying a new naming scheme based on specific patterns found in the original file names. It's particularly useful for organizing and standardizing file names automatically, such as renaming image files, log files, or any other types of files that follow a consistent naming convention."
  spec.homepage = "https://github.com/dacaiguoguo/rename_files_gem"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"
  spec.executables << 'rename_files_gem'

  # 如果你不使用私有 gem 服务器，可以删除或注释下面这行
  # spec.metadata["allowed_push_host"] = "https://gems.mycompany.com"
  
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/dacaiguoguo/rename_files_gem.git"
  spec.metadata["changelog_uri"] = "https://github.com/dacaiguoguo/rename_files_gem/blob/master/CHANGELOG.md"  

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "bin"
  # spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
