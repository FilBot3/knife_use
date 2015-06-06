# Knife Use

This is a knife plugin to allow a user to have multiple knife.rb files and use it similar to RVM, or PIK. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'knife_use'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install knife_use

## Usage

Create a standard knife.rb in your $HOME/.chef directory. Inside that knife.rb, place the following line, as it is required:  
```
Chef::Config.from_file("/home/user/.chef/knife.rb")
```
There must be an existing file there in order for Chef to utilize this plugin.   
Inside the $HOME/.chef directory, add the use_config.yml from the gem's example directory, and add the locations of the custom knife.rb files. The way this plugin works, it allows the $HOME/.chef/knife.rb to have global defaults, as it only changes the Chef::Config.from_file line. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/predatorian3/knife_use/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## I have to admit

I realize that this can be easily solved by having multiple chef-repo directories with the custom knife.rb files.