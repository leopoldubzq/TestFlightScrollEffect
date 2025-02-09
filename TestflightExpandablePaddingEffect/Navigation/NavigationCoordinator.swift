import SwiftUI

final class NavigationCoordinator: Coordinator & DestinationNavigable {
    @Published var route: [NavigationRoute] = []
}
