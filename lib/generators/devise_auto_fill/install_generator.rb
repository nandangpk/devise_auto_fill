module DeviseAutoFill
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def create_initializer
        copy_file 'initializer.rb', 'config/initializers/devise_auto_fill.rb'
      end
    end
  end
end