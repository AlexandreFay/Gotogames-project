source 'https://rubygems.org'

gem 'json', github: 'flori/json', branch: 'v1.8'
gem 'fastlane_ios', :git => 'git@bitbucket.org:ikomobi/fastlane_ios.git'
gem 'fastlane-plugin-git_jira_changelog', git: 'git@bitbucket.org:ikomobi/fastlane-plugin-git_jira_changelog.git'
gem 'slack-ruby-client'

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval(File.read(plugins_path), binding) if File.exist?(plugins_path)
