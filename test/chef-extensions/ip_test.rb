require File.expand_path('../../test_helper', __FILE__)
require 'chef-extensions/ip'

class Chef
  module Extensions
    describe IP do
      describe "osx" do
        before do
          ifconfig = IO.read(File.expand_path('../../fixtures/osx.ifconfig', __FILE__))
          IP.instance_variable_set(:@ifconfig, ifconfig)
        end

        it "all IPv4 addresses, excluding localhost" do
          IP.all.must_equal([
            "10.100.1.11",
            "10.100.1.10",
            "192.168.86.1",
            "192.168.203.1",
            "11.11.11.1"
          ])
        end
      end

      describe "ubuntu" do
        before do
          ifconfig = IO.read(File.expand_path('../../fixtures/ubuntu.ifconfig', __FILE__))
          IP.instance_variable_set(:@ifconfig, ifconfig)
          IP.instance_variable_set(:@filter, IP.send(:linux_filter))
        end

        it "all IPv4 addresses, excluding localhost" do
          IP.all.must_equal([
            "10.0.1.10",
            "11.11.11.10"
          ])
        end
      end
    end
  end
end
