# frozen_string_literal: true

module ActiveRecord
  module InstanceIncludes
    module Rails3Extensions
      def includes(*eager_loads)
        ActiveRecord::Associations::Preloader.new(self, eager_loads).run
        self
      end
    end
  end
end
