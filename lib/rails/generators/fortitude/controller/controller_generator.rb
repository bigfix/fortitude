require 'rails/generators/erb/controller/controller_generator'

module Fortitude
  module Generators
    class ControllerGenerator < Erb::Generators::ControllerGenerator
      source_root File.join(File.dirname(__FILE__), 'templates')

      def create_view_base
        generate "fortitude:base_view"
      end

      protected
      def handler
        :rb
      end
    end
  end
end
