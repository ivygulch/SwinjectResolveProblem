import Foundation
import Swinject
import AnalyticsModule

public class UserSessionModule {
    public static let assembly: Assembly = UserSessionAssembly()
}

class UserSessionAssembly: Assembly {

    func assemble(container: Container) {
        container.register(UserSessionLifecycleHelper.self) { (r) -> UserSessionLifecycleHelper in
            // This resolve statement will fail
            // If you set a breakpoint here, then drill down in LLDB, you will find
            // that `services` in `Container` actually has an entry for `UserSessionAnalyticsProviding`
            // but for some reason (classloading, framework, target, ??) it does not resolve.
            guard let analyticsProvider = r.resolve(UserSessionAnalyticsProviding.self) else {
                fatalError("This appears to be a bug in Swinject")
            }
            return UserSessionLifecycleHelper(analyticsProvider: analyticsProvider)
        }
        .inObjectScope(.container)
    }
    
}
