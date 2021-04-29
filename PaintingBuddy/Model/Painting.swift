//
//  Painting.swift
//  PaintingBuddy
//
//  Created by malakoipechyva on 8.04.21.
//

import Foundation

struct Painting: Codable {
    
    let title: String
    let artistName: String
    let dateOfPainting: String?
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case title, artistName
        case dateOfPainting = "yearAsString"
        case imageUrl = "image"
    }
    
}
