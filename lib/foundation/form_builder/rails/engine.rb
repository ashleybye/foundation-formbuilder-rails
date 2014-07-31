module Foundation
  module FormBuilder
    module Rails
      class Engine < ::Rails::Engine
        isolate_namespace Foundation::FormBuilder::Rails
      end
    end
  end
end