//
//  LaunchView.swift
//  SwiftUICoordinator
//
//  Created by Artem Gorshkov on 26.06.25.
//

import SwiftUI

struct LaunchView: View {
    @StateObject var viewModel: LaunchViewModel
    
    init(coordinator: AppCoordinator) {
        self._viewModel = .init(wrappedValue: LaunchViewModel(coordinator: coordinator))
    }
    
    var body: some View {
        VStack(spacing: 36) {
            Text("Launch view")
            
            Button(action: viewModel.setMainAsRoot) {
                Text("Start Main flow")
            }
            
            Button(action: viewModel.setOnboardingAsRoot) {
                Text("Start Onboarding flow")
            }
        }
    }
}

#Preview {
    LaunchView(coordinator: AppCoordinator(rootDestination: .constant(.launch)))
}

