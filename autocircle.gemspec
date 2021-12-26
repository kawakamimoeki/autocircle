
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "autocircle/version"

Gem::Specification.new do |spec|
  spec.name          = "autocircle"
  spec.version       = Autocircle::VERSION
  spec.authors       = ["cc-kawakami"]
  spec.email         = ["kawakami-moeki@colorfulcompany.co.jp"]

  spec.summary       = "Assist to write CircleCI config YAML."
  spec.homepage      = "https://github.com/colorfulcompany/autocircle"

  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/colorfulcompany/autocircle"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 1.1"
  spec.add_dependency "tty-prompt", "~> 0.23"
  spec.add_dependency "tty-spinner", "~> 0.9"
  spec.add_dependency "docker_registry2", "~> 1.10"
  spec.add_dependency "dry-schema", "~> 1.8"
  spec.add_dependency "octokit", "~> 4.0"
end
