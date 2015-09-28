[![Build Status](https://travis-ci.org/st0012/SafeFinder.svg)](https://travis-ci.org/st0012/SafeFinder)
[![Code Climate](https://codeclimate.com/github/st0012/SafeFinder/badges/gpa.svg)](https://codeclimate.com/github/st0012/SafeFinder)
[![Test Coverage](https://codeclimate.com/github/st0012/SafeFinder/badges/coverage.svg)](https://codeclimate.com/github/st0012/SafeFinder/coverage)
# SafeFinder

SafeFinder let you define model's null_object through simple DSL, and returns it when you can't find a result.

## Installation

Add this line to your application's Gemfile:

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

Now you can query like this, but it doesn't find anything:

```ruby
# It returns a null_object
null_object = Post.safely.find_by_title("New Post")

null_object.class   # NullPost
null_object.title   # nil
null_object.content # nil
```

### Custom Attribute & Method

And you can custom null_object's attribute or method using DSL:

```ruby
class Post < ActiveRecord::Base
  include SafeFinder
  
  safe_attribute :title, "Null"
  safe_method :some_method do
    "Do Something"
  end
end
```

### Get NullObject directly

Just simply use:
```ruby
Post.null_object => #<NullPost:0x007fa8a4713be0>
```

### Inheritance

All null_object inherits `SafeFinder::NullObject`, so you can add it in

```
app/models/safe_finder/null_object.rb
```

to define general methods for every null_object

```ruby
module SafeFinder
  class NullObject
    def hello
      "Hello"
    end
  end
end
```


## TODOs

- Add association support, like `user.post` should also returns null_object when it's nil
- Add generator for `NullObject` model
- More use cases in readme

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/st0012/SafeFinder.

