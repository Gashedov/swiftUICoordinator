import SwiftUI

class Coordinator: ObservableObject {
    enum CoordinationType {
        case navigation
        case sheet
        case fullScreenCover
        case modal
        case coverModal
    }
    
    struct State {
        var navigationPath: [CoordinationDestination] = []
        var presentingSheet: CoordinationDestination? = nil
        var presentingFullScreen: CoordinationDestination? = nil
        var presentingModal: CoordinationDestination? = nil
        var coveringModal: CoordinationDestination? = nil
        var rootDestination: Binding<CoordinationDestination>
        
        var isPresentingSheet: Bool {
            presentingSheet != nil || presentingModal != nil
        }
        
        var isPresentingFullScreen: Bool {
            presentingFullScreen != nil
        }
        
        var isCovering: Bool {
            coveringModal != nil
        }
    }
    
    @Published private(set) var state: State
    
    init(rootDestination: Binding<CoordinationDestination>) {
        state = State(rootDestination: rootDestination)
    }
    
    func view(for: CoordinationDestination, coordinationType: CoordinationType) -> AnyView {
        AnyView(EmptyView())
    }
    
    func setAsRoot(_ viewSpec: CoordinationDestination) {
        state.rootDestination.wrappedValue = viewSpec
        state.navigationPath = []
    }
}

extension Coordinator {
    func navigateTo(_ viewSpec: CoordinationDestination) {
        state.navigationPath.append(viewSpec)
    }
    
    func navigateBack() {
        guard !state.navigationPath.isEmpty else { return }
        state.navigationPath.removeLast()
    }
    
    func replaceNavigationStack(path: [CoordinationDestination]) {
        state.navigationPath = path
    }
    
    func presentSheet(_ viewSpec: CoordinationDestination) {
        if state.isPresentingSheet || state.isPresentingFullScreen { dismiss() }
        state.presentingSheet = viewSpec
    }
    
    func presentFullScreen(_ viewSpec: CoordinationDestination) {
        if state.isPresentingSheet || state.isPresentingFullScreen { dismiss() }
        state.presentingFullScreen = viewSpec
    }
    
    func presentModal(_ viewSpec: CoordinationDestination) {
        state.presentingModal = viewSpec
    }
    
    func coverModal(_ viewSpec: CoordinationDestination) {
        state.coveringModal = viewSpec
    }
    func popToRoot() {
        state.navigationPath = []
    }
    
    func dismiss() {
        if state.coveringModal != nil {
            state.coveringModal = nil
        } else if state.presentingSheet != nil {
            state.presentingSheet = nil
        } else if state.presentingFullScreen != nil {
            state.presentingFullScreen = nil
        } else if state.presentingModal != nil {
            state.presentingModal = nil
        } else if navigationPath.count > 0 {
            state.navigationPath.removeLast()
        }
    }
}

extension Coordinator {
    var navigationPath: Binding<[CoordinationDestination]> {
        binding(keyPath: \.navigationPath)
    }
    
    var presentingSheet: Binding<CoordinationDestination?> {
        binding(keyPath: \.presentingSheet)
    }
    
    var presentingFullScreen: Binding<CoordinationDestination?> {
        binding(keyPath: \.presentingFullScreen)
    }
    
    var presentingModal: Binding<CoordinationDestination?> {
        binding(keyPath: \.presentingModal)
    }
    
    var coveringModal: Binding<CoordinationDestination?> {
        binding(keyPath: \.coveringModal)
    }
    
    var rootDestinationPoint: Binding<CoordinationDestination> {
        state.rootDestination
    }
}

private extension Coordinator {
    func binding<T>(keyPath: WritableKeyPath<State, T>) -> Binding<T> {
        Binding(
            get: { self.state[keyPath: keyPath] },
            set: { self.state[keyPath: keyPath] = $0 }
        )
    }
}
