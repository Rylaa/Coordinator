
import UIKit



@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.tintColor = .white
        window!.overrideUserInterfaceStyle = .dark
        window!.makeKeyAndVisible()
        
        appCoordinator = AppCoordinator(window: window!)
        appCoordinator!.start(.Splash)
        
        return true
    }
}
