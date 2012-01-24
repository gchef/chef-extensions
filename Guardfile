require 'rdiscount'

guard 'rocco', :run_on => [:start, :change], :dir => 'docs' do
  watch(%r{^lib/.*\.rb$})
end

guard 'minitest', :notify => false do
  watch(%r|^test/(.*)_test\.rb|)
  watch(%r|^lib/(.*)([^/]+)\.rb|)     { |m| "test/#{m[1]}#{m[2]}_test.rb" }
  watch(%r|^test/test_helper\.rb|)    { "test" }
end
