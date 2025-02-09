import SwiftUI

struct MainScreen<DestinationHandler: DestinationNavigable>: View {
    
    @StateObject private var destinationHandler: DestinationHandler
    
    init(destinationHandler: DestinationHandler) {
        _destinationHandler = StateObject(wrappedValue: destinationHandler)
    }
    
    var body: some View {
        NavigationStack(path: $destinationHandler.route) {
            AppsScreen()
                .environmentObject(destinationHandler)
                .navigationDestination(for: NavigationRoute.self) {
                    destinationHandler.handleDestination($0)
                        .environmentObject(destinationHandler)
                }
        }
        .tint(.white)
    }
}

#Preview {
    MainScreen(destinationHandler: NavigationCoordinator())
}
