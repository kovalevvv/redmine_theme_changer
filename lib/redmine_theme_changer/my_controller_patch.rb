module RedmineThemeChanger
  module MyControllerPatch
    extend ActiveSupport::Concern

    included do
      alias_method_chain :account, :theme_changer
    end

    def account_with_theme_changer
      if params[:preview_theme].present?
        @user = User.current
        @pref = @user.pref
        @notifiables = Redmine::Notifiable.all
        @menu_items = Redmine::MenuManager.items(:project_menu).select {|m| m.respond_to? :caption}
        @user.safe_attributes = params[:user]
        @user.pref.attributes = params[:pref]
        @user.pref[:no_self_notified] = (params[:no_self_notified] == '1')
        @user.pref[:notified_events] = params[:notified_events]
        return
      end
      account_without_theme_changer
    end
  end
end
