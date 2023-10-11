//
//  Coordinator.swift
//  PhotoList
//
//  Created by Tricia Lorrainne Rullan Dela Cruz on 10/10/23.
//

import SwiftUI
import Combine

final class AppCoordinator: ObservableObject {
    @Published var path: NavigationPath
    private var cancellables = Set<AnyCancellable>()
    
    init(path: NavigationPath) {
        self.path = path
    }
    
    @ViewBuilder
    func build() -> some View {
        homeView()
    }
}

private extension AppCoordinator {
    func bind(view: HomeView) {
        view.didTapMenuItem
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] item in
                guard let self = self else { return }
                switch item {
                case .dogs:
                    self.dogsFlow()
                }
            })
            .store(in: &cancellables)
    }
    
    func push<T: Hashable>(_ coordinator: T) {
        path.append(coordinator)
    }
    
    func homeView() -> some View {
        let homeView = HomeView()
        bind(view: homeView)
        return homeView
    }
    
    func dogsFlow() {
        let coordinator = DogCoordinator(page: .list)
        self.bind(coordinator: coordinator)
        self.push(coordinator)
    }
    
    func bind(coordinator: DogCoordinator) {
        coordinator.pushCoordinator
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] coordinator in
                self?.push(coordinator)
            })
            .store(in: &cancellables)
    }
}
