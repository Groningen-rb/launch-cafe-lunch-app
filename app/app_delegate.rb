class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    window.makeKeyAndVisible
    window.rootViewController = LunchController.alloc.initWithNibName(nil, bundle: nil)
    true
  end
end
