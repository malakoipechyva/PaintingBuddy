//
//  PaintingViewModel.swift
//  PaintingBuddy
//
//  Created by malakoipechyva on 8.04.21.
//

import Foundation

class PaintingViewModel {
    
    //MARK: - Properties
    
    let imageURLStr = Box(" ")
    let paintingTitle = Box("loading...")

    private var paintings = [Painting]() {
        didSet {
            paintingTitle.value = paintings[0].title
            imageURLStr.value = paintings[1].imageUrl
        }
    }
    
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
