import SwiftUI

protocol Coordinator: AnyObject & ObservableObject {
    var route: [NavigationRoute] { get set }
    func push(_ destination: NavigationRoute)
    func popLast()
    func popToRoot()
}

extension Coordinator {
    func push(_ destination: NavigationRoute) {
        route.append(destination)
    }
    
    func popLast() {
        route.removeLast()
    }
    
    func popToRoot() {
        route.removeAll()
    }
}
