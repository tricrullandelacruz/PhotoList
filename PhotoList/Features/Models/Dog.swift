//
//  Dog.swift
//  PhotoList
//
//  Created by Tricia Lorrainne Rullan Dela Cruz on 10/10/23.
//

import Foundation

struct Dog: Codable {
    let image_link: String
    let good_with_children: Int
    let good_with_other_dogs: Int
    let shedding: Int
    let grooming: Int
    let drooling: Int
    let coat_length: Int
    let good_with_strangers: Int
    let playfulness: Int
    let protectiveness: Int
    let trainability: Int
    let energy: Int
    let barking: Int
    let min_life_expectancy: Int
    let max_life_expectancy: Int
    let max_height_male: Double
    let max_height_female: Double
    let max_weight_male: Double
    let max_weight_female: Double
    let min_height_male: Double
    let min_height_female: Double
    let min_weight_male: Double
    let min_weight_female: Double
    let name: String
}

extension Dog: Identifiable {
    var id: String { return name }
}
