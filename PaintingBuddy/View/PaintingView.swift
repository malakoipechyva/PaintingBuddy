//
//  PaintingView.swift
//  PaintingBuddy
//
//  Created by malakoipechyva on 21.04.21.
//

import UIKit

class PaintingView: UIScrollView {
    
    let imageView: UIImageView = {
       let iview = UIImageView()
        iview.contentMode = .scaleAspectFill
        return iview
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        
        backgroundColor = .black
        bounces = false
        minimumZoomScale = 0.5
        maximumZoomScale = 3.0

        addSubview(imageView)
        imageView.centerY(inView: self)
        imageView.anchor(left: leftAnchor, right: rightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension PaintingView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}
