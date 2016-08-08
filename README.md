# Yaml Enumeration

Create classes which work like
[ActiveRecord](http://guides.rubyonrails.org/active_record_basics.html)
classes, but are defined as fixed enumerations based on
[YAML](http://yaml.org)
files.

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'yaml_enumeration'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yaml_enumeration

## Usage

Let's assume you have a `User` class representing a user who can log into your app.
This user is supposed to have a home country, and you want to do things like

```ruby
user = User.new(country: Country.find_by_code('nz'))
puts user.country.code
# => 'nz'
puts user.country.name
# => 'New Zealand'
```

You can then simply create a `Country` class:

```ruby
# country.rb
class Country < YamlEnumeration::Enumeration
  # imports the definitions from the yaml file countries.yml
  load_values :countries

  # all and find_by_type are provided
  def self.find_by_code(code)
    all.detect {|m| m.code == code} || all.detect {|m| m.old_code == code}
  end
end
```

a `yaml` file containing all your countries:

```yaml
# countries.yml
---
nz:
  id: 1 # has to be provided
  type: new_zealand # has to be provided
  name: New Zealand
  code: nz
au:
  id: 2
  type: australia
  name: Australia
  code: au
...
```

and link that into your `User` class:

```ruby
# user.rb
class User < ActiveRecord::Base
  belongs_to_enumeration :country
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alto/yaml_enumeration. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
