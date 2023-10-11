//
//  Encodable.swift
//  PhotoList
//
//  Created by Tricia Lorrainne Rullan Dela Cruz on 10/10/23.
//

import Foundation

extension Encodable {
  func asDictionary() throws -> [String: Any] {
    let data = try JSONEncoder().encode(self)
    guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
      throw NSError()
    }
    return dictionary
  }
}
