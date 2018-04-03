# Crystal on Steroids [![Build Status](https://travis-ci.org/werner/crystal_on_steroids.png)](https://travis-ci.org/werner/crystal_on_steroids)


A group of methods to make Crystal more programmer friendly. Methods taken from Rails ActiveSupport, Powerpack and others.

[Api Docs](https://werner.github.io/crystal_on_steroids/)

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

**AliasMethod**

* alias_method

**Object**

* present?
* presence
* to_query
* to_param
* in?
* presence_in
* dig?

**Array**

* second
* third
* fourth
* fifth
* rest
* not_last
* dig
* split
* from
* to
* in_groups
* slice
* exactly?

**Hash**

* compact
* compact!
* dig

**Enumerable**

* blank?
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
* truncate
* truncate_words
* squish

**Int**

* multiple_of?
* ordinal
* ordinalize

**Number**

* bytes
* kilobytes
* megabytes
* gigabytes
* terabytes
* petabytes
* exabytes

**Regex**

* match?

**Range**

* overlaps?

**JSON::Any**

* dig

**YAML::Any**

* dig

More details in [docs](https://werner.github.io/crystal_on_steroids/)

## Contributing

1. Fork it ( https://github.com/werner/crystal_on_steroids/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [werner](https://github.com/werner) Werner Echezuría - creator, maintainer
