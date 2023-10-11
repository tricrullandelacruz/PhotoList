//
//  DogNetworkManager.swift
//  PhotoList
//
//  Created by Tricia Lorrainne Rullan Dela Cruz on 11/10/23.
//

import Moya

protocol DogNetworkManagerType {
    func getDogList(completion: @escaping (Result<[Dog], Error>) -> ())
}

struct DogNetworkManager: DogNetworkManagerType {
    private let service: NetworkManager<DogAPI>
    
    init(service: NetworkManager<DogAPI> = .init()) {
      self.service = service
    }
    
    func getDogList(completion: @escaping (Result<[Dog], Error>) -> ()) {
        service.request(target: .list, completion: completion)
    }
}
