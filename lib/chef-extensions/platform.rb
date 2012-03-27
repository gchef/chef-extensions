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

      # Returns true if architecture is 64bit!
      #
      def amd64?
        !! architecture.index("x86_64")
      end

      # Returns true if architecture is 32bit!
      #
      def i386?
        ! amd64?
      end

      # Package friendly architecture string
      #
      def arch
        amd64? ? "amd64" : "i386"
      end

      # Retrieves and caches the architecture type
      #
      def architecture
        @architecture ||= `uname -m`
      end
    end
  end
end
