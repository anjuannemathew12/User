
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.windows.forEach { window in
            if #available(iOS 13.0, *) {
                window.overrideUserInterfaceStyle = .light
            } else {
                // Fallback on earlier versions
            }
        }
        let iPhoneStoryBoard = UIStoryboard(name: "Main",bundle: nil)
   
        let logView = iPhoneStoryBoard.instantiateViewController(withIdentifier: "UserListViewController")
         window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationController = UINavigationController(rootViewController: logView)
        window?.rootViewController = navigationController
        navigationController.navigationBar.barTintColor = .white
        window?.makeKeyAndVisible()
        if #available(iOS 13, *) {
            let navAppearance = UINavigationBarAppearance()
            navAppearance.configureWithOpaqueBackground()
            navAppearance.backgroundColor = #colorLiteral(red: 0.6862745098, green: 0.3215686275, blue: 0.8705882353, alpha: 1)
//             let navigationBar = UINavigationBar()
//             navigationBar.tintColor = .white
            navAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().standardAppearance = navAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
            
            let tabAppearance = UITabBarAppearance()
            tabAppearance.configureWithOpaqueBackground()
            UITabBar.appearance().standardAppearance = tabAppearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabAppearance
            } else {
                // Fallback on earlier versions
            }
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

