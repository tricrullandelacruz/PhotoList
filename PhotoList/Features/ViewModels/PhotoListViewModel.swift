//
//  PhotoListViewModel.swift
//  PhotoList
//
//  Created by Tricia Lorrainne Rullan Dela Cruz on 10/10/23.
//

import Combine

final class PhotoListViewModel: ObservableObject {
    @Published var users: [Photo] = []
    
    func fetchUsers() {
        self.users = [
            Photo(id: 1, name: "User 1"),
            Photo(id: 2, name: "User 2"),
            Photo(id: 3, name: "User 3")
        ]
    }
}

