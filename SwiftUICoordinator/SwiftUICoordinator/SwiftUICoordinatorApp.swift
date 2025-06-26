//
//  SwiftUICoordinatorApp.swift
//  SwiftUICoordinator
//
//  Created by Artem Gorshkov on 26.06.25.
//

import SwiftUI

@main
struct SwiftUICoordinatorApp: App {
    @StateObject var appCoordinator = AppCoordinator(rootDestination: .constant(.launch))
    
    var body: some Scene {
        WindowGroup {
            appCoordinator.rootView.withAppRouter(appCoordinator)
        }
    }
}
