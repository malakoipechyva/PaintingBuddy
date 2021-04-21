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
    let artistTitle = Box(" ")
    let dateOfPainting = Box(0)

    private var paintings = [Painting]() {
        didSet {
            takeRandomPaintingForShow()
        }
    }
    
    private var paintingForShow = Painting(title: "", artistName: "", dateOfPainting: 0, imageUrl: "") {
        didSet {
            paintingTitle.value = paintingForShow.title
            artistTitle.value = paintingForShow.artistName
            imageURLStr.value = paintingForShow.imageUrl
            dateOfPainting.value = paintingForShow.dateOfPainting ?? 0
        }
    }
    
    //MARK: - API
    
    func fetchPaintings() {
        PaintingService.shared.fetchPaintings { gallery in
            self.paintings = gallery
        }
    }
    
    //MARK: - Helpers
    
    func takeRandomPaintingForShow() {
        if let painting = paintings.randomElement() {
            paintingForShow = painting
        }
    }
}
