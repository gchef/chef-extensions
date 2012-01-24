require 'socket'

class Chef
  module Extensions
    module IP
      extend self

      def all
        @all ||= Socket.ip_address_list
      end

      def ipv4
        all.select(&:ipv4?)
      end

      def ipv6
        all.select(&:ipv6?)
      end

      def addresses(type)
        self.send(type).map(&:ip_address)
      end
    end
  end
end
