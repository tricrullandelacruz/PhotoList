//
//  PhotoDetailsViewModel.swift
//  PhotoList
//
//  Created by Tricia Lorrainne Rullan Dela Cruz on 10/10/23.
//

import Combine

final class PhotoDetailsViewModel: ObservableObject {
    @Published var photo: Photo
    
    init(photo: Photo) {
        self.photo = photo
    }
}
