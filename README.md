# SwiftUI Coordinator

A simple and scalable navigation management solution for SwiftUI apps.
This Coordinator simplifies handling navigation, sheets, modals, full-screen covers, and more — all in one place.

⸻

# Features

✅ Manage navigation paths
✅ Present sheets, modals, full-screen covers, and covering modals
✅ Centralize app routing and state in one observable object
✅ Keep view code clean and decoupled from navigation logic

⸻

# Abilities & Usage Examples

Navigation:
```swift
coordinator.navigateTo(.main)
coordinator.navigateBack()
coordinator.popToRoot()
```

Sheets & Modals:
```swift
coordinator.presentSheet(.onboarding)
coordinator.presentModal(.launch)
coordinator.dismiss()
```

Full-Screen & Covers:
```swift
coordinator.presentFullScreen(.main)
coordinator.coverModal(.onboarding)
```

Set Root View:
```swift
coordinator.setAsRoot(.main)
```


# How It Works
	•	Coordinator holds all navigation state.
	•	AppCoordinatorViewModifier integrates the state into a NavigationStack with support for sheets, full-screen covers, and modals.
	•	AppCoordinator is a subclass that knows how to build views for each CoordinationDestination.

⸻

# Getting Started

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
