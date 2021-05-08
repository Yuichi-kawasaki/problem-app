# -*- encoding: utf-8 -*-
# stub: mini_racer 0.3.1 ruby lib ext
# stub: ext/mini_racer_extension/extconf.rb

Gem::Specification.new do |s|
  s.name = "mini_racer".freeze
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/discourse/mini_racer/issues", "changelog_uri" => "https://github.com/discourse/mini_racer/blob/v0.3.1/CHANGELOG", "documentation_uri" => "https://www.rubydoc.info/gems/mini_racer/0.3.1", "source_code_uri" => "https://github.com/discourse/mini_racer/tree/v0.3.1" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze, "ext".freeze]
  s.authors = ["Sam Saffron".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-07-23"
  s.description = "Minimal embedded v8 engine for Ruby".freeze
  s.email = ["sam.saffron@gmail.com".freeze]
  s.extensions = ["ext/mini_racer_extension/extconf.rb".freeze]
  s.files = ["ext/mini_racer_extension/extconf.rb".freeze]
  s.homepage = "https://github.com/discourse/mini_racer".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3".freeze)
  s.rubygems_version = "3.2.16".freeze
  s.summary = "Minimal embedded v8 for Ruby".freeze

  s.installed_by_version = "3.2.16" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 12.3.3"])
    s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0"])
    s.add_development_dependency(%q<rake-compiler>.freeze, [">= 0"])
    s.add_development_dependency(%q<m>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<libv8>.freeze, ["~> 8.4.255"])
  else
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 12.3.3"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
    s.add_dependency(%q<rake-compiler>.freeze, [">= 0"])
    s.add_dependency(%q<m>.freeze, [">= 0"])
    s.add_dependency(%q<libv8>.freeze, ["~> 8.4.255"])
  end
end
