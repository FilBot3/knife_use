#
#
#

require 'chef/knife'

module ConfigManage
  class UseList < Chef::Knife
    deps do
      #
      require 'yaml'
    end

    banner "knife use list (options)"

    option :knife_config_file,
      :short => "-C VALUE",
      :long => "--Conf VALUE",
      :description => "The config to load"

    def run
      # Look to see if --Conf is filled out if not fileld out, then set to default $HOME/.chef/use_config.yml
      read_config = "#{ENV['HOME']}/.chef/use_config.yml" #config[:knife_config_file] or 
      # Read teh config file
      yaml_config = YAML.load_file( read_config )
      # Display each entry in the config file
      yaml_config.each do |key, value|
        puts key.to_sym
      end
    end
  end
end
