[![Build Status](https://travis-ci.org/st0012/SafeFinder.svg)](https://travis-ci.org/st0012/SafeFinder)
[![Code Climate](https://codeclimate.com/github/st0012/SafeFinder/badges/gpa.svg)](https://codeclimate.com/github/st0012/SafeFinder)
[![Test Coverage](https://codeclimate.com/github/st0012/SafeFinder/badges/coverage.svg)](https://codeclimate.com/github/st0012/SafeFinder/coverage)
# SafeFinder

SafeFinder lets you define a model's `Null Object` through a simple DSL, and returns that when you don't find an instance of that model.

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'safe_finder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install safe_finder

## Usage

### Basic
Let's say you have a `Post` class, and it has `title` and `content` column.

First, you need to include `SafeFinder` in your model:

```ruby
class Post < ActiveRecord::Base
  include SafeFinder
end
```

Now you can query like this, and if it doesn't find anything it returns a `Null Object`:

```ruby
# It returns a Null Object
null_object = Post.safely.find_by_title("Not Exists")

null_object.class   # NullPost
null_object.title   # nil
null_object.content # nil
```

### Custom Attributes and Methods

And you can customize the Null Object's attributes or methods using a DSL:

```ruby
class Post < ActiveRecord::Base
  include SafeFinder
  
  safe_attribute :title, "Null"
  safe_method :some_method do
    "Do Something"
  end
end
```

```ruby
null_object = Post.safely.find_by_title("Not Exists")
null_object.title # "Null"
null_object.some_method # "Do Something"
```

### Get a Null Object directly

Just simply use:
```ruby
Post.null_object # <NullPost:0x007fa8a4713be0>
```

### Inheritance

All `Null Object`s inherit `SafeFinder::NullObject`, so you can add it in

```
app/models/safe_finder/null_object.rb
```

to define general methods for every `Null Object`n

```ruby
module SafeFinder
  class NullObject
    def hello
      "Hello"
    end
  end
end
```

```ruby
null_object = Post.null_object
null_object.hello # "Hello"
```


## TODOs

- Add association support, like `user.post` should also returns `Null Object` when it's nil
- Add generator for `NullObject` model
- More use cases in readme

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/st0012/SafeFinder.

