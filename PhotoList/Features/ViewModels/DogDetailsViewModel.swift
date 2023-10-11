//
//  DogDetailsViewModel.swift
//  PhotoList
//
//  Created by Tricia Lorrainne Rullan Dela Cruz on 10/10/23.
//

import Combine

final class DogDetailsViewModel: ObservableObject {
    @Published var dog: Dog?
    
    init(dog: Dog?) {
        self.dog = dog
    }
}
