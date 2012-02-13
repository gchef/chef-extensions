class Chef
  module Extensions
    module Platform
      extend self

      # Returns true if running on OS X
      #
      def os_x?
        RUBY_PLATFORM.index('darwin')
      end

      # Returns true if running on Linux
      #
      def linux?
        RUBY_PLATFORM.index('linux')
      end
    end
  end
end
