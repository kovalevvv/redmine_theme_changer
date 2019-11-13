module RedmineThemeChanger
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_my_account_preferences, :partial => 'user/theme_changer_preferences', :multipart => true
  end
end
