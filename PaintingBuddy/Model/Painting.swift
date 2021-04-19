//
//  Painting.swift
//  PaintingBuddy
//
//  Created by malakoipechyva on 8.04.21.
//

import Foundation

struct Painting: Codable {
    
    let title: String
    let contentId: Int
    let artistName: String
    let dateOfPainting: Int?
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case title, artistName
        case contentId
        case dateOfPainting = "completitionYear"
        case imageUrl = "image"
    }
    
}
