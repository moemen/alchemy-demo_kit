require 'rails'

module Alchemy
  module Generators
    class DemoKitGenerator < ::Rails::Generators::Base
      desc "This generator installs the Alchemy demo kit."
      source_root File.expand_path('../../../../app/views', File.dirname(__FILE__))

      def alchemy_scafffold
        invoke "alchemy:scaffold"
      end

      def copy_files
        copy_file "#{config_path}/elements.yml", "#{Rails.root}/config/alchemy/elements.yml"
        copy_file "#{config_path}/page_layouts.yml", "#{Rails.root}/config/alchemy/page_layouts.yml"
        copy_file "layouts/application.html.erb", "#{Rails.root}/app/views/layouts/application.html.erb"
        directory "alchemy/elements", "#{Rails.root}/app/views/alchemy/elements/"
        directory "alchemy/page_layouts", "#{Rails.root}/app/views/alchemy/page_layouts/"
      end

      def inject_css_into_env
        sentinel = /::Application\.configure do\s*$/
        inject_into_file "#{Rails.root}/config/environments/production.rb", "\n  config.assets.precompile += %w( alchemy/demo_kit.css )\n", { :after => sentinel, :verbose => true }
      end

    private

      def config_path
        @config_path ||= File.expand_path('../../../../config/alchemy', File.dirname(__FILE__))
      end

    end
  end
end
