module RedmineThemeChanger
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_user_preferences_start, :partial => 'user/theme_changer_preferences', :multipart => true
  end
end
