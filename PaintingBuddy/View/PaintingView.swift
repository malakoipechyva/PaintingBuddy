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
        return iview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        contentSize = imageView.image?.size ?? CGSize(width: frame.size.width, height: frame.size.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
