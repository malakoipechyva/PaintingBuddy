//
//  PaintingViewModel.swift
//  PaintingBuddy
//
//  Created by malakoipechyva on 8.04.21.
//

import UIKit
import CoreData

class PaintingViewModel {
    
    //MARK: - Properties
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
        let corePaintings: [NSManagedObject] = []

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
    
    func saveToContext(context: NSManagedObjectContext, gallery: [Painting]) {
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
    }
}
