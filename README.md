# chef-extensions

Commands useful for checking internet connectivity, VM presence etc.

## Install it

    gem install chef-extensions

## How it works

I'm only using chef-solo, so after installing the gem, require it in
`config/solo.rb`.

Then, in your cookbooks or providers, use one of the existing methods, eg:

    if Chef::Extensions.wan_up?
      # do some work...
    end

If you want to see use-cases for the gem, check out
[apt-cookbook](https://github.com/gchef/apt-cookbook/blob/master/providers/repository.rb).

[Full gem documentation](https://gchef.github.com/chef-extensions)

## Known issues / concerns

Google's DNS **very rarely** doesn't to pings. It's reliable 99.9% of the time,
which is good enough. Would defintely benefit from having 2 IPs and falling
back to the second one before returning false.

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a
  commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2012 Gerhard Lazu. See LICENSE for details.
