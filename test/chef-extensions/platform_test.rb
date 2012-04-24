require File.expand_path('../../test_helper', __FILE__)
require 'chef-extensions/platform'

class Chef
  module Extensions
    describe Platform do
      describe "32bit architectures" do
        before do
          Platform.instance_variable_set(:@architecture, "i686")
        end

        it "amd64?" do
          Platform.amd64?.must_equal false
        end

        it "x86_64?" do
          Platform.x86_64?.must_equal false
        end

        it "i386?" do
          Platform.i386?.must_equal true
        end

        it "i686?" do
          Platform.i686?.must_equal true
        end

        it "arch" do
          Platform.arch.must_equal "i386"
        end
      end

      describe "64bit architectures" do
        before do
          Platform.instance_variable_set(:@architecture, "x86_64")
        end

        it "amd64?" do
          Platform.amd64?.must_equal true
        end

        it "x86_64?" do
          Platform.x86_64?.must_equal true
        end

        it "i386?" do
          Platform.i386?.must_equal false
        end

        it "i686?" do
          Platform.i686?.must_equal false
        end

        it "arch" do
          Platform.arch.must_equal "amd64"
        end
      end
    end
  end
end
