#
#
#

require 'chef/knife'

module ConfigManage
  class UseConfig < Chef::Knife
    deps do
      #
      require 'yaml'
    end

    banner "knife use config CONFIG_VALUE (options)"

    option :knife_config_file,
      :short => "-C VALUE",
      :long => "--Conf VALUE",
      :description => "The config to load"

    def run
      custom_knife = {}
      # Check if --Conf was set, if not, use default $HOME/.chef/use_config.yml
      read_config = "#{ENV['HOME']}/.chef/use_config.yml" #config[:knife_config_file] or 
      # Read the config file
      yaml_config = YAML.load_file( read_config )
      # assign path to variable if it matches what is in the config and ARGV[2]
      yaml_config.each do |key, value|
        custom_knife = value if key == ARGV[2]
      end
      # Read the existing $HOME/.chef/knife.rb and replace the config line with our new config
      old_knife_config = File.read("#{ENV['HOME']}/.chef/knife.rb")
      # Sub the old line out for the new config
      new_knife_config = old_knife_config.gsub(/Chef::Config.from_file\(.*\)/, "Chef::Config.from_file(\"#{custom_knife['location']}\")")
      # Write the knife.rb file
      File.open("#{ENV['HOME']}/.chef/knife.rb", "w") { |file| file.puts new_knife_config }
    end
  end
end