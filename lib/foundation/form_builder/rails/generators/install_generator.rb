module Foundation
  module FormBuilder
    # module Rails
      module Generators
        class InstallGenerator < ::Rails::Generators::Base
          desc "This generator creates an initializer file at config/initializers/global_formbuilder.rb"
          source_root File.join(File.dirname(__FILE__), '..', 'templates')

          def add_initialiser
            # Adds an initialiser for global use of the FormBuilder
            settings_file = File.join(File.dirname(__FILE__),"..", "templates", "global_formbuilder.rb")
            create_file "config/initializers/global_formbuilder.rb", File.read(settings_file)
          end
        end
      end
    # end
  end
end