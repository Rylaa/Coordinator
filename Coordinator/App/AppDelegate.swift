
import UIKit



@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
  
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.tintColor = .white
        window!.overrideUserInterfaceStyle = .dark
        window!.makeKeyAndVisible()
        
        let appCoordinator = AppCoordinator(window: window!)
        appCoordinator.start(.Splash)
        
        return true
    }
}
