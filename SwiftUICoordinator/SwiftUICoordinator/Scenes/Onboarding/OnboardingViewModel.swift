//
//  OnboardingViewModel.swift
//  SwiftUICoordinator
//
//  Created by Artem Gorshkov on 26.06.25.
//

import Foundation

final class OnboardingViewModel: ObservableObject {
    @Published var isOnboardingCompleted: Bool = false
    
    weak var coordinator: AppCoordinator!
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
}
