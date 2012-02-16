require File.expand_path('../platform', __FILE__)

class Chef
  module Extensions
    # In Ruby 1.9, there is `Socket.ip_address_list`, which would simplify all
    # this greatly, but a lot of people still run chef under 1.8. This solution
    # will work with both 1.8 & 1.9.
    module IP
      extend self

      # **Get all public IPv4 addresses** <br />
      # Some of them might be local to the host, but it's not easy to say which
      # is which without expensive queries and a complicated logic. <br />
      # This method excludes localhost.
      def public_ipv4
        local_ipv4 - localhost_ipv4
      end

      # **Get all local IPv4 addresses** <br />
      # It includes localhost.
      def local_ipv4
        `echo "#{ifconfig}" | #{filter}`.split("\n")
      end

      def localhost_ipv4
        ["127.0.0.1"]
      end

      # **Runs ifconfig shell utility** <br />
      # Caching was not necessary, but it helps when testing.
      def ifconfig
        @ifconfig ||= `ifconfig`
      end

      protected

        # Selects the appropriate awk filering based on OS platform
        def filter
          @filter ||= if Platform.linux?
            linux_filter
          elsif Platform.os_x?
            os_x_filter
          else
            raise "Only works on Linux or OS X"
          end
        end

        # Linux's ifconfig returns a slightly different version than OS X's.
        def linux_filter
          "#{awk} { print $4 }'"
        end

        def os_x_filter
          "#{awk} { print $2 }'"
        end

        # Common to both OS X & Linux
        def awk
          %{awk -F"[: ]+" '/inet /}
        end

    end
  end
end
