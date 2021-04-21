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
        backgroundColor = .blue

        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
