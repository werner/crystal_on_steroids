# Crystal on Steroids [![Build Status](https://travis-ci.org/werner/crystal_on_steroids.png)](https://travis-ci.org/werner/crystal_on_steroids) [![docrystal.org](http://www.docrystal.org/badge.svg?style=round)](http://www.docrystal.org/github.com/werner/crystal_on_steroids)

A group of methods to make Crystal more programmer friendly. Methods taken from Rails ActiveSupport and others.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  crystal_on_steroids:
    github: werner/crystal_on_steroids
```

## Usage

```crystal
require "crystal_on_steroids"
```

#### Methods

**Object**

* blank?
* present?
* presence
* to_query
* to_param
* in?
* presence_in

**Array**

* second
* third
* fourth
* fifth
* rest

**Hash**

* compact
* compact!

**Enumerable**

* many?
* pluck
* excludes?
* without
* avg (average)

**Time**

* prev_day
* next_day
* yesterday
* tomorrow
* today?

**String**

* remove

More details in [docs](http://www.docrystal.org/github.com/werner/crystal_on_steroids)

## Contributing

1. Fork it ( https://github.com/werner/crystal_on_steroids/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [werner](https://github.com/werner) Werner Echezuría - creator, maintainer
