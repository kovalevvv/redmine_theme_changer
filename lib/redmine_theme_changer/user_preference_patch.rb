module RedmineThemeChanger
  module UserPreferencePatch

    def self.included(base)
      base.send(:include, InstanceMethods)
    end

    module InstanceMethods
      def theme
        self[:theme] if self[:theme].present?
      end

      def theme=(name)
        self[:theme] = name
      end
    end
  end
end
