//
//  OnboardingView.swift
//  SwiftUICoordinator
//
//  Created by Artem Gorshkov on 26.06.25.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel: OnboardingViewModel
    
    init(coordinator: AppCoordinator) {
        self._viewModel = .init(wrappedValue: OnboardingViewModel(coordinator: coordinator))
    }
    
    var body: some View {
        Text("OnboardingView")
    }
}
