# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'activerecord/instance_includes/version'

Gem::Specification.new do |spec|
  spec.name          = 'activerecord-instance_includes'
  spec.version       = ActiveRecordInstanceIncludes::VERSION
  spec.authors       = ['Aleck Greenham']
  spec.email         = ['greenhama13@gmail.com']
  spec.summary       = 'Adds includes method to ActiveRecord instances.'
  spec.description   = 'Provides an #includes method to eager load associations of ActiveRecord instances, ' \
                        'for when you don\'t have access to the class object or ActiveRecord::Relation instance.'
  spec.homepage      = 'https://github.com/greena13/activerecord-instance_includes'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.8.7'
  spec.add_dependency 'activerecord', '>= 3.0.0'
end
