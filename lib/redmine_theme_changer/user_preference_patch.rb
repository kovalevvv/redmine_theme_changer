module RedmineThemeChanger
  module UserPreferencePatch
    extend ActiveSupport::Concern

    def theme
      self[:theme] if self[:theme].present?
    end

    def theme=(name)
      self[:theme] = name
    end
  end
end
