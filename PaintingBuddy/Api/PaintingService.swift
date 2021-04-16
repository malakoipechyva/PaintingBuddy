//
//  PaintingService.swift
//  PaintingBuddy
//
//  Created by malakoipechyva on 22.03.21.
//

import Foundation

struct PaintingService {
    
    static let shared = PaintingService()
    
    private let url = URL(string: "https://www.wikiart.org/en/App/Painting/MostViewedPaintings")
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    
    
    func fetchPaintings() {
        guard let url = url else { return }
        let task = session.dataTask(with: url) { (data, response, error) in
            print(data)
            print(response)
            print(error)
        }
        task.resume()
    }
    
}
