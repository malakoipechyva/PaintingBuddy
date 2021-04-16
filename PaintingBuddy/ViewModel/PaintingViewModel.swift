//
//  PaintingViewModel.swift
//  PaintingBuddy
//
//  Created by malakoipechyva on 8.04.21.
//

import Foundation

struct PaintingViewModel {
    
    private var paintings = [Painting]()
    
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    //MARK: - Selectors
    
    //MARK: - API
    
    func fetchPaintings() {
        
        PaintingService.shared.fetchPaintings()
    }
    
    //MARK: - Helpers
    
}
