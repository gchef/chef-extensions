require 'securerandom'

require 'chef-extensions/version'
require 'chef-extensions/ec2'
require 'chef-extensions/ip'

class Chef
  module Extensions
    extend self

    # **Ping Google's DNS.** <br />
    # If it doesn't hear back within 2s, it's safe to
    # assume that we don't have internet connectivity
    def wan_up?
      `ping -c 1 8.8.8.8 -W 2`.include? "1 received"
    end

    # **Checks if vagrant user exists.** <br />
    # If it does, we're running in the context of a VirtualBox VM, provisioned
    # through Vagrant.
    def vagrant?
      @vagrant ||= `id vagrant 2>&1`.index 'uid'
    end

    # **Check if this instance ID is a valid one.** <br />
    # If it contains 'i-', it's safe to assume that we're running within
    # the context of an EC2 instance.
    def ec2?
      @ec2 ||= EC2.instance_id.include?('i-')
    end

    # **Generate base64 password using SecureRandom.** <br />
    # Trims the ending ==.
    def password(length=20)
      SecureRandom.base64(length+2).tr('=', '')
    end
  end
end
