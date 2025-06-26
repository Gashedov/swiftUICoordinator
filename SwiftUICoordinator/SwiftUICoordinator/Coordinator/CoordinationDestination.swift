import Foundation

enum CoordinationDestination {
    case launch
    case main
    case onboarding
}

extension CoordinationDestination: Identifiable {
    var id: Int {
        return switch self {
        case .launch: 0
        case .main: 1
        case .onboarding: 2
        }
    }
}

extension CoordinationDestination: Equatable, Hashable {
    static func == (lhs: CoordinationDestination, rhs: CoordinationDestination) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
