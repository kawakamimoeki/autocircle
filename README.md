# Autocircle

Autocircle is a interactive CircleCI configuration generator tool.

## Installation

    $ gem install specific_install
    $ gem specific_install https://github.com/colorfulcompany/autocircle v0.1.0

## Usage

```bash
$ autocircle generate
language: ruby
[▁] Loading ruby versions ... Done!
? What ruby version?: 3.0.3
? Do you use variant?: node
? Do you do browser test? Yes
? Select browser: chrome
? Default branch: main
[▅] Writing ./circleci/config.yml ... Done!
✔︎ .circleci/config.yml is generated!
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
