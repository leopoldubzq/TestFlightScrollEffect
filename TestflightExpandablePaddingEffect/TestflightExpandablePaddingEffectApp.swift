import SwiftUI

@main
struct TestflightExpandablePaddingEffectApp: App {
    var body: some Scene {
        WindowGroup {
            MainScreen(destinationHandler: NavigationCoordinator())
        }
    }
}
