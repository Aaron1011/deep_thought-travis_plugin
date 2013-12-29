# Deep Thought Travis CI Plugin
[![Build Status](https://travis-ci.org/Aaron1011/deep_thought-travis_plugin.png?branch=master)](https://travis-ci.org/Aaron1011/deep_thought-travis_plugin)

A Deep Thought plugin for Travis CI.

To use it, set the following environment variables:

    CI_SERVICE=travis
    CI_SERVICE_ENDPOINT=http://api.travis-ci.org # This can also be the URL of a custom Travis CI setup

If you are using Travis Pro, or a custom Travis setup that requires an access token, set these environment variables instead:

    CI_SERVICE=travis
    CI_SERVICE_ENDPOINT=http://api.travis-ci.com # This can also be the URL of a custom Travis CI setup
    CI_SERVICE_ACCESS_TOKEN=YOUR_ACCESS_TOKEN

You can obtain an access token by installing [the Travis client](http://rubygems.org/gems/travis), and running `travis token`.
