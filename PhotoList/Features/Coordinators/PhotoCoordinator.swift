//
//  PhotoCoordinator.swift
//  PhotoList
//
//  Created by Tricia Lorrainne Rullan Dela Cruz on 10/10/23.
//

import SwiftUI
import Combine

// Enum to identify User flow screen Types
enum PhotoFlowType: String, Identifiable {
    case list, details
    
    var id: String {
        self.rawValue
    }
}

final class PhotoCoordinator: ObservableObject, Hashable {
    @Published var page: PhotoFlowType
    
    private var id: UUID
    private var userID: Int?
    private var cancellables = Set<AnyCancellable>()
    
    let pushCoordinator = PassthroughSubject<PhotoCoordinator, Never>()
    
    init(page: PhotoFlowType, userID: Int? = nil) {
        id = UUID()
        self.page = page
        
        if page == .details {
            guard let userID = userID else {
                fatalError("userID must be provided for profile type")
            }
            self.userID = userID
        }
    }
    
    @ViewBuilder
    func build() -> some View {
        switch self.page {
        case .list:
            photoListView()
        case .details:
            photoListView()
        }
    }
    
    // MARK: Required methods for class to conform to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: PhotoCoordinator, rhs: PhotoCoordinator) -> Bool {
        return lhs.id == rhs.id
    }
    
    // MARK: View Creation Methods
    private func photoListView() -> some View {
        let viewModel = PhotoListViewModel()
        let photoListView = PhotoListView(viewModel: viewModel)
        bind(view: photoListView)
        return photoListView
    }
    
//    private func userDetailsView() -> some View {
//        let viewModel = UserDetailsViewModel(userID: userID ?? 0)
//        let userDetailsView = UserDetailsView(viewModel: viewModel)
//        return userDetailsView
//    }
    
    // MARK: View Bindings
    private func bind(view: PhotoListView) {
        view.didClickUser
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] user in
                //self?.showUserProfile(for: user)
            })
            .store(in: &cancellables)
    }
}

// MARK: Navigation Related Extensions
private extension PhotoCoordinator {
    func showPhoto(for user: Photo) {
        pushCoordinator.send(PhotoCoordinator(page: .details, userID: user.id))
    }
}
