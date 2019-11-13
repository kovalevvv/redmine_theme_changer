module RedmineThemeChanger
  module MyControllerPatch
    
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        alias_method_chain :account, :theme_changer
      end
    end

    module InstanceMethods
      def account_with_theme_changer
        if params[:preview_theme].present?
          @user = User.current
          @user.pref.theme = params[:pref][:theme]
          return
        end
        account_without_theme_changer
      end
    end
  end
end
