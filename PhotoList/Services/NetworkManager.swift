//
//  NetworkManager.swift
//  PhotoList
//
//  Created by Tricia Lorrainne Rullan Dela Cruz on 11/10/23.
//

import Moya

typealias completion<T> = (Result<T, Error>) -> ()

protocol NetworkManagerType {
    associatedtype Provider
    func request<T: Decodable>(target: Provider, completion: @escaping (Result<T, Error>) -> ())
}
    
struct NetworkManager<U: TargetType>: NetworkManagerType {
    var provider = MoyaProvider<U>(plugins: [NetworkLoggerPlugin()])
    
    func request<T: Decodable>(target: U, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
