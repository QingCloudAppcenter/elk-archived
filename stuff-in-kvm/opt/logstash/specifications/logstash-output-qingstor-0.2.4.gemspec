# -*- encoding: utf-8 -*-
# stub: logstash-output-qingstor 0.2.4 ruby lib

Gem::Specification.new do |s|
  s.name = "logstash-output-qingstor"
  s.version = "0.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = { "logstash_group" => "output", "logstash_plugin" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib"]
  s.authors = ["Evan Zhao"]
  s.date = "2017-08-18"
  s.description = "Collect the outputs of logstash and store into Qingstor"
  s.email = "tacingiht@gmail.com"
  s.homepage = "https://github.com/yunify/logstash-output-qingstor"
  s.licenses = ["Apache License (2.0)"]
  s.rubygems_version = "2.4.8"
  s.summary = "logstash output plugin for qingstor"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<logstash-core-plugin-api>, ["~> 2.0"])
      s.add_runtime_dependency(%q<logstash-codec-plain>, [">= 0"])
      s.add_runtime_dependency(%q<qingstor-sdk>, [">= 1.9.2"])
      s.add_runtime_dependency(%q<concurrent-ruby>, [">= 0"])
      s.add_development_dependency(%q<stud>, ["~> 0.0.22"])
      s.add_development_dependency(%q<logstash-devutils>, [">= 0"])
    else
      s.add_dependency(%q<logstash-core-plugin-api>, ["~> 2.0"])
      s.add_dependency(%q<logstash-codec-plain>, [">= 0"])
      s.add_dependency(%q<qingstor-sdk>, [">= 1.9.2"])
      s.add_dependency(%q<concurrent-ruby>, [">= 0"])
      s.add_dependency(%q<stud>, ["~> 0.0.22"])
      s.add_dependency(%q<logstash-devutils>, [">= 0"])
    end
  else
    s.add_dependency(%q<logstash-core-plugin-api>, ["~> 2.0"])
    s.add_dependency(%q<logstash-codec-plain>, [">= 0"])
    s.add_dependency(%q<qingstor-sdk>, [">= 1.9.2"])
    s.add_dependency(%q<concurrent-ruby>, [">= 0"])
    s.add_dependency(%q<stud>, ["~> 0.0.22"])
    s.add_dependency(%q<logstash-devutils>, [">= 0"])
  end
end
