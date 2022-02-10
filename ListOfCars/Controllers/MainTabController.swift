//
//  MainTabController.swift
//  ListOfCars
//
//  Created by Luis Eduardo Silva Oliveira on 09/02/22.
//

import UIKit

class MainTabController: UITabBarController {
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    //MARK: - Helpers
    func configureViewControllers() {
        
        ///ListCar
        let listCar = ListCarViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let nav1 = templateNavigationController(image: UIImage(systemName: "house"), rootViewController: listCar, title: "Lista de Carros")
        
        viewControllers = [nav1]
    }
    
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController, title: String?) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.tabBarItem.title = title
        
        return nav
    }
}
