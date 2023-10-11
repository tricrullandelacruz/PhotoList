//
//  APIService.swift
//  PhotoList
//
//  Created by Tricia Lorrainne Rullan Dela Cruz on 10/10/23.
//

import Foundation

enum APIStatusCode: Int {
    case success = 200
    case error = 400
}

struct APIService {
    static func request<T: Decodable>(route: APIProtocol) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: route.request())
        let statusCode = (response as? HTTPURLResponse)?.statusCode
        let code =  APIStatusCode(rawValue: statusCode ?? APIStatusCode.error.rawValue)
        
        switch code {
        case .success:
            do {
                return try JSONDecoder () . decode(T.self, from: data)
            } catch {
                throw APIError.decodingError
            }
        default:
            throw APIError.badRequest
        }
    }
}
