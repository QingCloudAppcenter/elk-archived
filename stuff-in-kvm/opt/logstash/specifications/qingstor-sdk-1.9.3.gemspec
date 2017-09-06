# -*- encoding: utf-8 -*-
# stub: qingstor-sdk 1.9.3 ruby lib

Gem::Specification.new do |s|
  s.name = "qingstor-sdk"
  s.version = "1.9.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org" } if s.respond_to? :metadata=
  s.require_paths = ["lib"]
  s.authors = ["Yunify SDK Group"]
  s.bindir = "exe"
  s.date = "2017-03-15"
  s.description = "The official QingStor SDK for Ruby programming language."
  s.email = ["sdk_group@yunify.com"]
  s.homepage = "https://github.com/yunify/qingstor-sdk-ruby"
  s.licenses = ["Apache-2.0"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.4.8"
  s.summary = "SDK for QingStor"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, ["~> 4.1.16"])
      s.add_runtime_dependency(%q<net-http-persistent>, ["~> 2.9.4"])
      s.add_runtime_dependency(%q<mimemagic>, ["~> 0.3.2"])
      s.add_development_dependency(%q<bundler>, ["> 1.10.0"])
      s.add_development_dependency(%q<rake>, ["~> 11.3.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.5.0"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.12.0"])
      s.add_development_dependency(%q<rubocop>, ["~> 0.41.0"])
    else
      s.add_dependency(%q<activesupport>, ["~> 4.1.16"])
      s.add_dependency(%q<net-http-persistent>, ["~> 2.9.4"])
      s.add_dependency(%q<mimemagic>, ["~> 0.3.2"])
      s.add_dependency(%q<bundler>, ["> 1.10.0"])
      s.add_dependency(%q<rake>, ["~> 11.3.0"])
      s.add_dependency(%q<rspec>, ["~> 3.5.0"])
      s.add_dependency(%q<simplecov>, ["~> 0.12.0"])
      s.add_dependency(%q<rubocop>, ["~> 0.41.0"])
    end
  else
    s.add_dependency(%q<activesupport>, ["~> 4.1.16"])
    s.add_dependency(%q<net-http-persistent>, ["~> 2.9.4"])
    s.add_dependency(%q<mimemagic>, ["~> 0.3.2"])
    s.add_dependency(%q<bundler>, ["> 1.10.0"])
    s.add_dependency(%q<rake>, ["~> 11.3.0"])
    s.add_dependency(%q<rspec>, ["~> 3.5.0"])
    s.add_dependency(%q<simplecov>, ["~> 0.12.0"])
    s.add_dependency(%q<rubocop>, ["~> 0.41.0"])
  end
end
