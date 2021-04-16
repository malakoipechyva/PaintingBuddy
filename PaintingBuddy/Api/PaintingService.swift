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
    
    func fetchPaintings(completion: @escaping ([Painting]) -> Void) {
        guard let url = url else { return }
        // [weak self] ?
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            let result = parseJSON(data: data)
            switch result {
            case let .success(paintings):
                completion(paintings)
            case let .failure(error):
                print(error)
            }

        }
        task.resume()
    }
    
    func parseJSON(data: Data) -> Result<[Painting], Error> {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MMMM"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        do {
            let decodedData = try decoder.decode([Painting].self, from: data)
            return .success(decodedData)
        } catch {
            return .failure(error)
        }
    }
}
