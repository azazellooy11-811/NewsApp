//
//  TabBarController.swift
//  NewsApp
//
//  Created by Азалия Халилова on 27.04.2023.
//

import UIKit

final class TabBarContoller: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.tintColor = .black
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        
        
        viewControllers = [
            setupNavigationController(rootViewController: GeneralViewController(viewModel: GeneralViewModel()),
                                      title: "General",
                                      image: UIImage(systemName: "newspaper") ?? .add),
            setupNavigationController(rootViewController: BusinessViewController(viewModel: BusinessViewModel()),
                                      title: "Business",
                                      image: UIImage(systemName: "briefcase") ?? .add),
            setupNavigationController(rootViewController: TechnologyViewController(),
                                      title: "Technology",
                                      image: UIImage(systemName: "gyroscope") ?? .add)
        ]
    }
    
    private func setupNavigationController(rootViewController: UIViewController,
                                           title: String,
                                           image: UIImage) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        rootViewController.navigationItem.title = title
        navigationController.navigationBar.prefersLargeTitles = true
        
        return navigationController
    }
}
