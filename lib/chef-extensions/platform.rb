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

      def x86_64?
        !! architecture.index("x86_64")
      end
      alias :amd64? :x86_64?

      def i686?
        ! x86_64?
      end
      alias :i386? :i686?

      # Package friendly architecture string
      #
      def arch
        x86_64? ? "amd64" : "i386"
      end

      # Retrieves and caches the architecture type,
      # every Linux OS understands uname
      #
      def architecture
        @architecture ||= `uname -m`
      end
    end
  end
end
