# frozen_string_literal: true

module ActiveRecord
  module InstanceIncludes
    module Rails4Extensions
      def includes(*eager_loads)
        ActiveRecord::Associations::Preloader.new.preload(self, eager_loads)
        self
      end
    end
  end
end
