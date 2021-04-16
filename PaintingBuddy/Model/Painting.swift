//
//  Painting.swift
//  PaintingBuddy
//
//  Created by malakoipechyva on 8.04.21.
//

import Foundation

struct Gallery: Codable {
    let paintings: [Painting]
    
    enum CodingKeys: String, CodingKey {
      case paintings
    }
}

struct Painting: Codable {
    
    let title: String
    let contentId: Int
    let artistName: String
    let dateOfPainting: String?
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case title, artistName
        case contentId
        case dateOfPainting = "yearAsString"
        case imageUrl = "image"
    }
    
}
