//
//  TabController.swift
//  Tab-Page VC
//
//  Created by ebpearls on 22/05/2023.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
         
    }
    
    private func setup() {
        generateChildren()
    }
    
    private func generateChildren() {
        
        let home = createTab(title: "Home", image: UIImage(systemName: "house")!, vc: HomeController())
        let search = createTab(title: "Search", image: UIImage(systemName: "magnifyingglass.circle")!, vc: SearchController())
        let notification = createTab(title: "Notifications", image: UIImage(systemName: "bell")!, vc: NotificationController())
        let profile = createTab(title: "Profile", image: UIImage(systemName: "person.crop.circle")!, vc: ProfileController())
        
        setViewControllers([home,search,notification,profile], animated: true) 
    }
    
    private func createTab(title: String, image: UIImage, vc: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: vc)
        ///name short cha vane yo use garni
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        ///name long cha vane yo use garni
        nav.viewControllers.first?.navigationItem.title = title + "Controller"
        
        return nav
    }
}
