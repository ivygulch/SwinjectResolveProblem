import UIKit
import Swinject
import UserSessionModule
import AnalyticsModule

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIViewController()

        let assembler = Assembler()
        assembler.apply(assemblies: [AnalyticsModule.assembly, UserSessionModule.assembly])

        let _ = assembler.resolver.resolve(UserSessionLifecycleHelper.self)

        return true
    }

}
