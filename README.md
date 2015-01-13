# NewsletterReader

This gem helps with, well... reading newsletters on Gmail.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'newsletter_reader'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install newsletter_reader

## Dependencies

Newsletter sender requires ruby 2.1 to work.

Until [this](https://github.com/nu7hatch/gmail/pull/127) gets solved, you'll have to use my branch of the gem. Add this line to your Gemfile:

```ruby
gem 'gmail', github: 'zamith/gmail', branch: 'patch-1'
```

## Usage

Tag your newsletter emails with the label "newsletter" in your Gmail account.

Get all of the newsletter links from your account with:

```
NewsletterReader.newsletters
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/newsletter_reader/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
