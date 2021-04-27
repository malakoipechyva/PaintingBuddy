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
    
    private let paintingView: PaintingView = {
       let pView = PaintingView()
        return pView
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
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
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
        viewModel.dateOfPainting.bind { [weak self] date in
            self?.dateLabel.text = "\(date)"
        }
        
        viewModel.imageURLStr.bind { [weak self] urlStr in
            guard let url = URL(string: urlStr) else { return }
            self?.paintingView.imageView.sd_setImage(with: url, completed: nil)
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
        view.addSubview(paintingView)
        paintingView.anchor(top: view.topAnchor, left: view.leftAnchor,bottom: view.bottomAnchor, right: view.rightAnchor)
        
        let bottomStack = UIStackView(arrangedSubviews: [artistLabel, dateLabel])
        bottomStack.spacing = 3
        
        let infoStack = UIStackView(arrangedSubviews: [titleLabel, bottomStack])
        infoStack.axis = .vertical
        infoStack.spacing = 10
        infoStack.alignment = .center
        infoStack.backgroundColor = .black
        
        view.addSubview(infoStack)
        infoStack.centerX(inView: view)
        infoStack.anchor(bottom: view.bottomAnchor, paddingBottom: 100)
        
        view.addSubview(actionButton)
        actionButton.centerX(inView: view)
        actionButton.anchor(bottom: view.bottomAnchor, paddingBottom: 20)
    }
}
