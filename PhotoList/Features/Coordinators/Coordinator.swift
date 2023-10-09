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
    func bind(view: PhotoListView) {
        view.didClickUser
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] user in
                guard let self = self else { return }
                //self?.showUserProfile(for: user)
            })
            .store(in: &cancellables)
    }
    
    func push<T: Hashable>(_ coordinator: T) {
        path.append(coordinator)
    }
    
    func homeView() -> some View {
        let viewModel = PhotoListViewModel()
        let photoListView = PhotoListView(viewModel: viewModel)
        bind(view: photoListView)
        return photoListView
    }
}
