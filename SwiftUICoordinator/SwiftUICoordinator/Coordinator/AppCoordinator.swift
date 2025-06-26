import SwiftUI

final class AppCoordinator: Coordinator {    
    @Published var rootView: AnyView = AnyView(EmptyView())
    
    override init(rootDestination: Binding<CoordinationDestination>) {
        super.init(rootDestination: rootDestination)
        setAsRoot(rootDestination.wrappedValue)
    }

    override func view(for destination: CoordinationDestination, coordinationType: CoordinationType) -> AnyView {
        let view = buildView(for: destination, coordinationType: coordinationType)
            .background(InteractivePopGestureEnabler())
        return AnyView(view)
    }
    
    override func setAsRoot(_ destination: CoordinationDestination) {
        super.setAsRoot(destination)
        rootView = view(for: destination, coordinationType: .fullScreenCover)
    }
}

extension AppCoordinator {
    func buildView(for destination: CoordinationDestination, coordinationType: CoordinationType) -> some View {
        Group {
            switch destination {
            case .launch: LaunchView(coordinator: self)
            case .main: MainView(coordinator: self)
            case .onboarding: OnboardingView(coordinator: self)
            }
            
        }
        .environmentObject(self)
    }
}
