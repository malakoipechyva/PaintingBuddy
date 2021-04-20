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
    
    private init() {    }
    
    func fetchPaintings(completion: @escaping ([Painting]) -> Void) {
        guard let url = url else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else { return }
                let result = parseJSON(data: data)
                switch result {
                case let .success(paintings):
                    completion(paintings)
                case let .failure(error):
                    print(error.localizedDescription)
                }
            }
        }
        .resume()
    }
    
    
    func parseJSON(data: Data) -> Result<[Painting], Error> {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([Painting].self, from: data)
            return .success(decodedData)
        } catch {
            return .failure(error)
        }
    }
}
