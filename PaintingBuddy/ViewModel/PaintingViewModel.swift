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
            takeRandomPainting(gallery: paintings)
        }
    }
    
    //MARK: - Lifecycle
    
    //MARK: - API
    
    func fetchPaintings() {
        PaintingService.shared.fetchPaintings { gallery in
            self.paintings = gallery
        }
    }
    
    //MARK: - Helpers
    
    func takeRandomPainting(gallery: [Painting]) {
        if let painting = gallery.randomElement() {
            paintingTitle.value = painting.title
            imageURLStr.value = painting.imageUrl
        } else {
            paintingTitle.value = gallery[0].title
            imageURLStr.value = gallery[0].imageUrl
        }
    }
}
