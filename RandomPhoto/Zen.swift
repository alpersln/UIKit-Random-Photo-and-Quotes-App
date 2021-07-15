//
//  Quotes.swift
//  RandomPhoto
//
//  Created by calatinalper on 14.07.2021.
//

import Foundation


struct Zen: Codable {
    let a: String
    let q: String
    
    
    enum CodingKeys: String, CodingKey {
        case a
        case q
    }
}
