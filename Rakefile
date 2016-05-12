# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/tvos'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'TVMLCatalog'

  app.codesign_certificate = nil # FIXME
  app.provisioning_profile = nil # FIXME

  app.identifier = 'com.beyondludus.tvmlcatalog'
  app.entitlements['application-identifier'] = app.seed_id + '.' + app.identifier

  app.frameworks << "TVMLKit"

  # For development only to allow http:// protocol
  # https:// required by default
  app.info_plist['NSAppTransportSecurity'] = { 'NSAllowsArbitraryLoads' => true }
end
