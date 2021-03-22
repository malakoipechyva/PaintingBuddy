//
//  MainTabController.swift
//  PaintingBuddy
//
//  Created by malakoipechyva on 19.03.21.
//

import UIKit

class MainTabController: UITabBarController {
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
        configureViewControllers()
    }
    
    //MARK: - Selectors
    
    //MARK: - API
    
    //MARK: - Helpers
    
    
    
    func configureViewControllers() {
        let painting = PaintingController()
        painting.tabBarItem.image = UIImage(systemName: "photo")
        let search = SearchController()
        search.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        viewControllers = [painting, search]
    }
}
