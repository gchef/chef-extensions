class Chef
  module Extensions
    module EC2
      extend self

      # **Get the instance ID from AWS's metadata service** <br />
      # If we don't hear back within 1 second, time out.
      def instance_id
        `curl --connect-timeout 1 http://169.254.169.254/2011-01-01/meta-data/instance-id 2>&1`.chomp
      end
    end
  end
end
