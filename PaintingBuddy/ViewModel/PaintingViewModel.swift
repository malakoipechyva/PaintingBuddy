//
//  PaintingViewModel.swift
//  PaintingBuddy
//
//  Created by malakoipechyva on 8.04.21.
//

import Foundation

class PaintingViewModel {
    
    //MARK: - Properties
    
    let defaults = UserDefaults.standard
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Paintings.plist")
    let decoder = PropertyListDecoder()
    
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
            self.saveToDefaults(gallery: gallery)
        }
    }
    
    //MARK: - Helpers
    
    func takeRandomPaintingForShow() {
        if let painting = paintings.randomElement() {
            paintingForShow = painting
        }
    }
    
    func saveToDefaults(gallery: [Painting]) {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(gallery)
            try data.write(to: self.dataFilePath!)
        } catch {
            print("error saving to plist :  \(error)")
        }
    }
    
    func loadFromDefaults() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                paintings = try decoder.decode([Painting].self, from: data)
            } catch {
                print("error loading data : \(error)")
            }
        }
    }
}
