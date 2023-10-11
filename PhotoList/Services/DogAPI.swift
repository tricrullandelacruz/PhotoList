//
//  DogAPI.swift
//  PhotoList
//
//  Created by Tricia Lorrainne Rullan Dela Cruz on 10/10/23.
//

import Foundation
import Moya

enum DogAPI {
    case list
}

extension DogAPI: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: APIConstants.baseURL) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .list:
            return ""
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .list:
            return .requestParameters(parameters: (try? DogListParameter().asDictionary()) ?? [:], encoding: URLEncoding.default)
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json",
                "X-Api-Key" : APIConstants.apiKey]
    }
    
    var sampleData: Data {
        return Data()
    }
}
