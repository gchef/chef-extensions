require 'chef-extensions/version'
require 'securerandom'

module Chef
  module Extensions
    extend self

    # **Ping Google's DNS.** <br />
    # If it doesn't hear back within 1s, it's safe to
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

    # **Get this instance's ID.** <br />
    # If within 1s it gets a response which starts with 'i-', it's safe to
    # assume that we're running within the context of an EC2 instance.
    def ec2?
      @ec2 ||= `curl --connect-timeout 1 http://169.254.169.254/2011-01-01/meta-data/instance-id 2>&1`.include?('i-')
    end

    # **Generate base64 password using SecureRandom.** <br />
    # Trims the ending ==.
    def password(length=20)
      SecureRandom.base64(length+2).tr('=', '')
    end
  end
end
