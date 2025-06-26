//
//  MainView.swift
//  SwiftUICoordinator
//
//  Created by Artem Gorshkov on 26.06.25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel
    
    init(coordinator: AppCoordinator) {
        self._viewModel = .init(wrappedValue: MainViewModel(coordinator: coordinator))
    }
    
    var body: some View {
        Text("Main View")
    }
}
