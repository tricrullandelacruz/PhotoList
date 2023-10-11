//
//  DogListViewModel.swift
//  PhotoList
//
//  Created by Tricia Lorrainne Rullan Dela Cruz on 10/10/23.
//

import Combine
import Foundation

final class DogListViewModel: ObservableObject {
    enum State {
        case loading
        case failed(Error)
        case loaded([Dog])
        case empty
    }
    
    @Published private(set) var state = State.loading
    private let networkManager: DogNetworkManager
    
    init(networkManager: DogNetworkManager = DogNetworkManager()) {
        self.networkManager = networkManager
        
        getDogList()
    }
}

private extension DogListViewModel {
    func getDogList() {
        state = .loading
        
        networkManager.getDogList { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .success(dogs):
                self.state = .loaded(dogs)
            case let .failure(error):
                self.state = .failed(error)
            }
        }
    }
}
