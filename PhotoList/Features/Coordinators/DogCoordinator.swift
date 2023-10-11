//
//  DogCoordinator.swift
//  PhotoList
//
//  Created by Tricia Lorrainne Rullan Dela Cruz on 10/10/23.
//

import SwiftUI
import Combine

enum DogFlowType: String, Identifiable {
    case list, details
    
    var id: String {
        self.rawValue
    }
}

final class DogCoordinator: ObservableObject, Hashable {
    @Published var page: DogFlowType
    
    private var id: UUID
    private var dog: Dog?
    private var cancellables = Set<AnyCancellable>()
    
    let pushCoordinator = PassthroughSubject<DogCoordinator, Never>()
    
    init(page: DogFlowType, dog: Dog? = nil) {
        id = UUID()
        self.page = page
        
        if page == .details {
            guard let dog = dog else {
                fatalError("Dog is required")
            }
            self.dog = dog
        }
    }
    
    @ViewBuilder
    func build() -> some View {
        switch self.page {
        case .list:
            dogListView()
        case .details:
            dogDetailsView()
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: DogCoordinator, rhs: DogCoordinator) -> Bool {
        return lhs.id == rhs.id
    }
}


private extension DogCoordinator {
    func dogListView() -> some View {
        let viewModel = DogListViewModel()
        let view = DogListView(viewModel: viewModel)
        bind(view: view)
        return view
    }
    
    func dogDetailsView() -> some View {
        let viewModel = DogDetailsViewModel(dog: dog)
        let view = DogDetailsView(viewModel: viewModel)
        return view
    }
    
    func bind(view: DogListView) {
        view.didTapRow
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] photo in
                self?.showDogDetails(photo)
            })
            .store(in: &cancellables)
    }
    
    func showDogDetails(_ dog: Dog) {
        pushCoordinator.send(DogCoordinator(page: .details, dog: dog))
    }
}
