module RedmineThemeChanger
  module ApplicationHelperPatch
    extend ActiveSupport::Concern
    included do
      alias_method_chain :current_theme, :changer
    end
    def current_theme_with_changer
      unless instance_variable_defined?(:@current_theme)
        @current_theme = Redmine::Themes.theme(User.current.pref.theme || Setting.ui_theme)
      end
      @current_theme
    end
  end
end