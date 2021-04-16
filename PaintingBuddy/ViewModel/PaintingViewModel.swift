//
//  PaintingViewModel.swift
//  PaintingBuddy
//
//  Created by malakoipechyva on 8.04.21.
//

import Foundation

struct PaintingViewModel {
    
    //MARK: - Properties
    
    private var paintings = [Painting]()

    //MARK: - Lifecycle
    
    //MARK: - Selectors
    
    //MARK: - API
    
    func fetchPaintings() {
        PaintingService.shared.fetchPaintings { gallery in
            print(gallery[0])
        }
    }
    
    //MARK: - Helpers
    
}
