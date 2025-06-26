//
//  LaunchViewModel.swift
//  SwiftUICoordinator
//
//  Created by Artem Gorshkov on 26.06.25.
//

import Foundation

final class LaunchViewModel: ObservableObject {
    @Published var isLoading: Bool = true
    weak var coordinator: AppCoordinator!
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func setMainAsRoot() {
        coordinator.setAsRoot(.main)
    }
    
    func setOnboardingAsRoot() {
        coordinator.setAsRoot(.onboarding)
    }
}
