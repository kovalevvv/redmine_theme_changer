# Theme Changer plugin for Redmine
# Copyright (C) 2010-2011  Haruyuki Iida
#rev
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

require 'redmine_theme_changer/hooks'

Rails.configuration.to_prepare do
  unless UserPreference.included_modules.include? RedmineThemeChanger::UserPreferencePatch
    UserPreference.send(:include, RedmineThemeChanger::UserPreferencePatch)
  end
  unless MyController.included_modules.include? RedmineThemeChanger::MyControllerPatch
    MyController.send(:include, RedmineThemeChanger::MyControllerPatch)
  end
  unless ApplicationHelper.included_modules.include? RedmineThemeChanger::ApplicationHelperPatch
    ApplicationHelper.send(:include, RedmineThemeChanger::ApplicationHelperPatch)
  end
end

Redmine::Plugin.register :redmine_theme_changer do
  name 'Redmine Theme Changer plugin'
  author 'Anton Argirov'
  description 'Lets each user select a theme for Redmine'
  version '0.0.1'
  url 'http://redmine.academ.org'
  requires_redmine :version_or_higher => '1.3.0'
end
