//
//  MainViewModel.swift
//  SwiftUICoordinator
//
//  Created by Artem Gorshkov on 26.06.25.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Published var text: String = ""
    
    weak var coordinator: AppCoordinator!
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
}
