# -*- encoding: utf-8 -*-
# stub: logstash-input-qingstor 0.1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "logstash-input-qingstor"
  s.version = "0.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = { "logstash_group" => "input", "logstash_plugin" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib"]
  s.authors = ["Evan Zhao"]
  s.date = "2017-06-06"
  s.description = "Fetch file from Qingstor as the input of logstash"
  s.email = "tacingiht@gmail.com"
  s.homepage = "https://github.com/yunify/logstash-input-qingstor"
  s.licenses = ["Apache License (2.0)"]
  s.rubygems_version = "2.4.8"
  s.summary = "logstash input plugin for QingStor"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<logstash-core-plugin-api>, ["<= 2.99", ">= 1.6"])
      s.add_runtime_dependency(%q<logstash-codec-plain>, [">= 0"])
      s.add_runtime_dependency(%q<stud>, [">= 0.0.22"])
      s.add_runtime_dependency(%q<qingstor-sdk>, [">= 1.9.2"])
      s.add_development_dependency(%q<logstash-devutils>, [">= 0"])
    else
      s.add_dependency(%q<logstash-core-plugin-api>, ["<= 2.99", ">= 1.6"])
      s.add_dependency(%q<logstash-codec-plain>, [">= 0"])
      s.add_dependency(%q<stud>, [">= 0.0.22"])
      s.add_dependency(%q<qingstor-sdk>, [">= 1.9.2"])
      s.add_dependency(%q<logstash-devutils>, [">= 0"])
    end
  else
    s.add_dependency(%q<logstash-core-plugin-api>, ["<= 2.99", ">= 1.6"])
    s.add_dependency(%q<logstash-codec-plain>, [">= 0"])
    s.add_dependency(%q<stud>, [">= 0.0.22"])
    s.add_dependency(%q<qingstor-sdk>, [">= 1.9.2"])
    s.add_dependency(%q<logstash-devutils>, [">= 0"])
  end
end
