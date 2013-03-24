class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @lunches_controller = LunchesController.alloc.initWithLunch(@lunch)
    @nav_controller = UINavigationController.alloc.initWithRootViewController(@lunches_controller)

    @window.rootViewController = @nav_controller

    @window.makeKeyAndVisible
    true
  end

end
