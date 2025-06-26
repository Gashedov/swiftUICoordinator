import SwiftUI

struct AppCoordinatorViewModifier: ViewModifier {
    @ObservedObject var coordinator: AppCoordinator
    
    func body(content: Content) -> some View {
        NavigationStack(path: coordinator.navigationPath) {
            content
                .environmentObject(coordinator)
                .navigationDestination(for: CoordinationDestination.self) { destination in
                    coordinator.view(for: destination, coordinationType: .navigation)
                }
        }.sheet(item: coordinator.presentingSheet) { destination in
            coordinator.view(for: destination, coordinationType: .sheet)
        }.fullScreenCover(item: coordinator.presentingFullScreen) { destination in
            coordinator.view(for: destination, coordinationType: .fullScreenCover)
        }.modal(item: coordinator.presentingModal) { destination in
            coordinator.view(for: destination, coordinationType: .modal)
        }.cover(item: coordinator.coveringModal) { destination in
            coordinator.view(for: destination, coordinationType: .coverModal)
        }
    }
}

extension View {
    func withAppCoordinator(_ router: AppCoordinator) -> some View {
        modifier(AppCoordinatorViewModifier(coordinator: router))
    }
}
