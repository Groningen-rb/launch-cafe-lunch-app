# This file is automatically generated. Do not edit.

if Object.const_defined?('TestFlight') and !UIDevice.currentDevice.model.include?('Simulator')
  NSNotificationCenter.defaultCenter.addObserverForName(UIApplicationDidBecomeActiveNotification, object:nil, queue:nil, usingBlock:lambda do |notification|
  TestFlight.takeOff('44af1ad12b490762ac48990d7f8343b4_MjAzMjA5MjAxMy0wMy0yNCAxMTo0OTozNS4yMzQzOTM')
  end)
end
