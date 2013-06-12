# Polyglot
Cookbook for easily setting up a sane Ruby, Java, Clojure, Python, and Android
environment. Made to complement [Builder](https://github.com/SimpleFinance/chef-builder), but a good starting point for any
team working with a variety of languages, especially on the JVM.

## Usage
This cookbook makes some assumptions about your deployment environment, but
ships with attributes to make switching things in or out as easy as possible.

The standard environment you get via `polyglot::default` is:
* Oracle JDK6
* Maven 3.0.5
* Ruby 2.0.0-rc1
* JRuby 1.7.2
* Leiningen 2
* Python 2.7.1
* Android SDK 21.1 (disabled by default)
* Go 1.1.0

In the near future, we'll extend this cookbook for some other languages. Since
this cookbook is a wrapper for a variety of language-specific cookbooks, it's
easy to swap out attribute values for another that you'd prefer. They are as
follows:

* Java: `node[:java][:java_flavor]`
* Maven: `node[:maven][:version]`
* (J)Ruby: `node[:rbenv][:rubies]`
* Leiningen: `node[:polyglot][:clojure][:lein_url]`
* Python: `node[:python][:version]`
* Android: `node[:polyglot][:android][:sdk_url]`

## Author
Simple Finance <ops@simple.com>

## License
Apache License, Version 2.0

