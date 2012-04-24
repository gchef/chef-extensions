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
      def x86_64?
        !! architecture.index("x86_64")
      end
      alias :amd64? :x86_64?

      # Returns true if architecture is 32bit!
      #
      def i686?
        ! x86_64?
      end
      alias :i386? :i686?

      # Package friendly architecture string
      #
      def arch
        x86_64? ? "amd64" : "i386"
      end

      # Retrieves and caches the architecture type
      #
      def architecture
        @architecture ||= `uname -m`
      end
    end
  end
end
