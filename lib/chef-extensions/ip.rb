require File.expand_path('../platform', __FILE__)

class Chef
  module Extensions
    module IP
      extend self

      # **Get all local IPv4 addresses** <br />
      # It excludes localhost. Easily adaptable to IPv6. <br />
      # In Ruby 1.9, this is a simple call to `Socket.ip_address_list`.
      def all
        local_ips - localhost
      end

      protected

        def local_ips
          `echo "#{ifconfig}" | #{filter}`.split("\n")
        end

        def localhost
          ["127.0.0.1"]
        end

        def ifconfig
          @ifconfig ||= `ifconfig`
        end

        def filter
          @filter ||= if Platform.linux?
            linux_filter
          elsif Platform.os_x?
            os_x_filter
          else
            raise "Only works on Linux or OS X"
          end
        end

        def linux_filter
          "#{awk} { print $4 }'"
        end

        def os_x_filter
          "#{awk} { print $2 }'"
        end

        def awk
          %{awk -F"[: ]+" '/inet /}
        end

    end
  end
end
