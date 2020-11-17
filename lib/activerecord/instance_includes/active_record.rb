# frozen_string_literal: true

require 'active_support'
require 'active_support/lazy_load_hooks'

ActiveSupport.on_load(:active_record) do
  if ActiveRecord::VERSION::MAJOR == 3 && ActiveRecord::VERSION::MINOR >= 1
    include ActiveRecord::InstanceIncludes::Rails3Extensions
  elsif ActiveRecord::VERSION::MAJOR >= 4
    include ActiveRecord::InstanceIncludes::Rails4Extensions
  end
end
