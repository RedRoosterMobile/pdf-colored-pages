[![Build Status](https://travis-ci.org/RedRoosterMobile/pdf-colored-pages.svg?branch=master)](https://travis-ci.org/RedRoosterMobile/pdf-colored-pages)
[![Coverage Status](https://coveralls.io/repos/github/RedRoosterMobile/pdf-colored-pages/badge.svg?branch=master)](https://coveralls.io/github/RedRoosterMobile/pdf-colored-pages?branch=master)
=========
# PdfColoredPages

Ruby Gem to check which pages of a pdf contain color and output those.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pdf_colored_pages'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pdf_colored_pages

## Usage

As Array:
```ruby
PdfColoredPages.as_array(/path/to/pdf.pdf)
# returns [1,3,4]
```

As Range String:
```ruby
PdfColoredPages.as_range_string(/path/to/pdf.pdf)
# returns: 1,3-4
```

Just Check:
```ruby
PdfColoredPages.colored_pages?(/path/to/pdf.pdf)
# returns: true or false
```

Test:

    $ rake test

## Contributing

1. Fork it ( https://github.com/RedRoosterMobile/pdf-colored-pages/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
