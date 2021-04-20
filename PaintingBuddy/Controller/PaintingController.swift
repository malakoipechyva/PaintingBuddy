//
//  PaintingController.swift
//  PaintingBuddy
//
//  Created by malakoipechyva on 19.03.21.
//

import UIKit
import SDWebImage

class PaintingController: UIViewController {
    //MARK: - Properties
    
    private let viewModel = PaintingViewModel()
    
    private let imageView: UIImageView = {
        let iview = UIImageView()
        iview.contentMode = .scaleAspectFill
        return iview
    }()
    
    private let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(handleActionButtonTap), for: .touchUpInside)
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    private let artistLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        fetchPainting()
        
        viewModel.paintingTitle.bind { [weak self] title in
            self?.titleLabel.text = title
        }
        viewModel.artistTitle.bind { [weak self] title in
            self?.artistLabel.text = title
        }
        
        viewModel.imageURLStr.bind { [weak self] urlStr in
            guard let url = URL(string: urlStr) else { return }
            self?.imageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    //MARK: - Selectors
    
    @objc func handleActionButtonTap() {
        viewModel.takeRandomPaintingForShow()
    }
    
    //MARK: - API
    
    func fetchPainting() {
        viewModel.fetchPaintings()
    }
    
    //MARK: - Helpers
    func configureUI() {
        view.addSubview(imageView)
        imageView.anchor(top: view.topAnchor, left: view.leftAnchor,bottom: view.bottomAnchor, right: view.rightAnchor)
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, artistLabel])
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        stack.backgroundColor = .black
        view.addSubview(stack)
        stack.centerX(inView: imageView)
        stack.anchor(bottom: imageView.bottomAnchor, paddingBottom: 100)
        
        view.addSubview(actionButton)
        actionButton.centerX(inView: imageView)
        actionButton.anchor(bottom: imageView.bottomAnchor, paddingBottom: 20)
    }
}
