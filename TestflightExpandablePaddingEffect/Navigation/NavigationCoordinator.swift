import SwiftUI

final class NavigationCoordinator: Coordinator & DestinationHandlable {
    @Published var route: [NavigationRoute] = []
}
