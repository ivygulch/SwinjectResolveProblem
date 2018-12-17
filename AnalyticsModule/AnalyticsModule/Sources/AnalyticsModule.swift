import Foundation
import Swinject

public class AnalyticsModule {
    public static let assembly: Assembly = AnalyticsAssembly()
}

class AnalyticsAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(UserSessionAnalyticsProviding.self) { (r) -> UserSessionAnalyticsProviding in
            return UserSessionAnalyticsProvider()
        }
        .inObjectScope(.container)
    }
    
}
