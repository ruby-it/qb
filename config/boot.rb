RAILS_ROOT = File.join(File.dirname(__FILE__), '..')


require 'date'
unless File.directory?("#{RAILS_ROOT}/vendor/rails")
  require 'rubygems'
  require 'initializer'
else
  #yeah this should not be necessary
  Dir['vendor/**/*/lib'].each do |dir|
    $: << dir
  end

  require "#{RAILS_ROOT}/vendor/rails/railties/lib/initializer"
  require 'active_support' 
  require 'active_support/core_ext' 
  require 'active_support/core_ext/time/conversions' 
  
end
