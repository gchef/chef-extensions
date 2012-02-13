class Chef
  module Extensions
    module Platform
      extend self

      def os_x?
        RUBY_PLATFORM.index('darwin')
      end

      def linux?
        RUBY_PLATFORM.index('linux')
      end
    end
  end
end
