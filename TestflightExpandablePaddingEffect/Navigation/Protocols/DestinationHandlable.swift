import Foundation
import SwiftUI

protocol DestinationHandlable: AnyObject & ObservableObject {
    associatedtype T: View
    var route: [NavigationRoute] { get set }
    func handleDestination(_ destination: NavigationRoute) -> T
}

extension DestinationHandlable {
    func handleDestination(_ destination: NavigationRoute) -> some View {
        switch destination {
        case .appDetails(let app):
            AppDetailsScreen(app: app)
        }
    }
}
