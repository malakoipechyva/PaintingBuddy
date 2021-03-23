//
//  PaintingController.swift
//  PaintingBuddy
//
//  Created by malakoipechyva on 19.03.21.
//

import UIKit

class PaintingController: UIViewController {
    //MARK: - Properties
    
    private let imageView: UIImageView = {
        let iview = UIImageView()
        iview.backgroundColor = .systemTeal
        iview.contentMode = .scaleAspectFit
        return iview
    }()
    
    private let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(handleActionButtonTap), for: .touchUpInside)
        return button
    }()
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPurple
        configureUI()
        fetchPainting()
    }
    
    //MARK: - Selectors
    
    @objc func handleActionButtonTap() {
        print("DEBUG: handle next painting tap...")
    }
    
    //MARK: - API
    
    func fetchPainting() {
        PaintingService.shared.fetchPainting()
    }
    
    //MARK: - Helpers
    func configureUI() {
        view.addSubview(imageView)
        imageView.anchor(top: view.topAnchor, left: view.leftAnchor,bottom: view.bottomAnchor, right: view.rightAnchor,
                         paddingBottom: 80)
        
        view.addSubview(actionButton)
        actionButton.centerX(inView: imageView)
        actionButton.anchor(bottom: imageView.bottomAnchor, paddingBottom: 20)
    }
}
