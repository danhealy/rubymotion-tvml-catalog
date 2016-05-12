class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @tv_base_url = "http://localhost:9001/"
    @tv_app_url  = "js/application.js"

    appControllerContext = TVApplicationControllerContext.alloc.init
    appControllerContext.launchOptions = {"BASEURL" => @tv_base_url}
    appControllerContext.javaScriptApplicationURL = NSURL.URLWithString("#{@tv_base_url}#{@tv_app_url}")

    # @jsContext = JSContext.alloc.init

    @appController = TVApplicationController.alloc.initWithContext(appControllerContext, window: @window, delegate: self)

    jsPrint("Hello from RubyMotion!")
    true
  end

  def jsPrint(string)
    @appController.evaluateInJavaScriptContext(-> evaluation {
        cons = evaluation.objectForKeyedSubscript("jsPrint")
        cons.callWithArguments([string])
      },
      completion: -> evaluated {
        puts "Evaluated: #{evaluated}"
      })
  end

  def application(application, didFailWithError: error)
    puts "didFailWithError: #{error}"

    title = "Error Launching Application"
    message = error.localizedDescription
    alert = UIAlertController.alertControllerWithTitle(title, message: msg, preferredStyle: UIAlertControllerStyleAlert)

    @appController.navigationController.presentViewController(alertController, animated: true, completion: -> {
      # ...
    })
  end

  def application(application, didStopWithOptions: options)
    puts "didStopWithOption: #{options}"
  end

end
