import Foundation
import SwiftUI

protocol DestinationNavigable: AnyObject & ObservableObject {
    associatedtype T: View
    var route: [NavigationRoute] { get set }
    func handleDestination(_ destination: NavigationRoute) -> T
}

extension DestinationNavigable {
    func handleDestination(_ destination: NavigationRoute) -> some View {
        switch destination {
        case .appDetails(let app):
            AppDetailsScreen(app: app)
        }
    }
}
