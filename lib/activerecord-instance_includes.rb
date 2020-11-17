# frozen_string_literal: true

module ActiveRecord
  module InstanceIncludes
    autoload :Rails3Extensions, 'activerecord/instance_includes/rails3_extensions'
    autoload :Rails4Extensions, 'activerecord/instance_includes/rails4_extensions'
  end
end

require 'activerecord/instance_includes/active_record'
