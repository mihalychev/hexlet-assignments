# Ipgeobase

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add ipgeobase

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install ipgeobase

## Usage

    $ ip_meta = Ipgeobase.lookup('8.8.8.8')
    $ ip_meta.city # Ashburn
    $ ip_meta.country # United States
    $ ip_meta.countryCode # US
    $ ip_meta.lat # 39.03
    $ ip_meta.lon # -77.5

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
