require File.expand_path('../../test_helper', __FILE__)
require 'chef-extensions/ip'

class Chef
  module Extensions
    describe IP do
      describe "all" do
        it "returns all local ips" do
          IP.all.each do |ip|
            ip.must_be_instance_of Addrinfo
          end
        end
      end

      describe "ipv4" do
        it "only returns IPv4 ips" do
          IP.ipv4.each do |ip|
            ip.must_be :ipv4?
          end
        end
      end

      describe "ipv6" do
        it "only returns IPv6 ips" do
          IP.ipv6.each do |ip|
            ip.must_be :ipv6?
          end
        end
      end

      describe "addresses" do
        it "returns ips of a certain type as strings" do
          IP.addresses(:ipv4).each do |ip|
            ip.must_match /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/
          end
        end
      end
    end
  end
end
