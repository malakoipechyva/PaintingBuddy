//
//  PaintingViewModel.swift
//  PaintingBuddy
//
//  Created by malakoipechyva on 8.04.21.
//

import Foundation

class PaintingViewModel {
    
    //MARK: - Properties
    
    private var paintings = [Painting]() {
        didSet {
            paintingTitle.value = paintings[0].title
            imageURLStr.value = paintings[0].imageUrl
        }
    }
    
    let imageURLStr = Box(" ")
    let paintingTitle = Box("loading...")

    //MARK: - Lifecycle
    
    //MARK: - Selectors
    
    //MARK: - API
    
    func fetchPaintings() {
        PaintingService.shared.fetchPaintings { gallery in
            self.paintings = gallery
        }
    }
    
    //MARK: - Helpers
    
}
