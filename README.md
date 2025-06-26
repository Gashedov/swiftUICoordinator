# SwiftUI Coordinator

A simple and scalable navigation management solution for SwiftUI apps.
This Coordinator simplifies handling navigation, sheets, modals, full-screen covers, and more — all in one place.


# Features

- Manage navigation paths
- Present sheets, modals, full-screen covers, and covering modals
- Centralize app routing and state in one observable object
- Keep view code clean and decoupled from navigation logic


# Abilities & Usage Examples

Navigation:
```swift
coordinator.navigateTo(.main)
coordinator.navigateBack()
coordinator.popToRoot()
```

Sheets & Modals:
```swift
coordinator.presentSheet(.helpSheet)
coordinator.presentModal(.safariWebView)
coordinator.dismiss()
```

Full-Screen & Covers:
```swift
coordinator.presentFullScreen(.paywall)
coordinator.coverModal(.setup)
```

Set Root View:
```swift
coordinator.setAsRoot(.main)
```


# How It Works
- Coordinator holds all navigation state.
- AppCoordinatorViewModifier integrates the state into a NavigationStack with support for sheets, full-screen covers, and modals.
- AppCoordinator is a subclass that knows how to build views for each CoordinationDestination.


# Getting Started

Define your sceens in CoordinationDestination enum:

```swift
enum CoordinationDestination {
    case launch
    case main
    case onboarding
}
```


Inside AppCoordinator extension find buildView(for:, coordinationType:) and provide view for each CoordinationDestination enum case.
Pass AppCoordinator to each view to use it from futher coordination, keep variable week or unnowed
(You can fund example how to pass AppCoordinator to ScreenViewModel through its initializer in repository usage code)


```swift
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
```

Integrate into your App:
```swift
@main
struct MyApp: App {
    @StateObject var appCoordinator = AppCoordinator(rootDestination: .constant(.launch))

    var body: some Scene {
        WindowGroup {
            appCoordinator.rootView.withAppCoordinator(appCoordinator)
        }
    }
}
```

User coordinator inside your View or ViewModel:


```swift
coordinator.presentFullScreen(.paywall)
```


