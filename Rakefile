# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bubble-wrap/all'
require 'motion-testflight'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'LC Lunch'
  app.interface_orientations = [:portrait]
  app.identifier = "org.groningen-rb.launch-cafe-lunch-app"

  app.testflight.sdk = 'vendor/TestFlight'
  app.testflight.api_token  = 'ENV["TF_API_TOKEN"]'
  app.testflight.team_token = 'ENV["TF_TEAM_TOKEN"]'
end
