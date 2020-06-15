//
//  ProfileCoordinator.swift
//  RizNewsApp
//
//  Created by Mohamed Rizvi on 6/14/20.
//  Copyright © 2020 RizviOrganization. All rights reserved.
//

import UIKit

class ProfileCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    var childCoordinators = [Coordinator]()
    
    var navController: UINavigationController
    
    init(_ navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        navController.delegate = self
        let profileViewModel = RZ_ProfileViewModel()
        let profileView = RZ_ProfileView()
        profileView.profileViewModel = profileViewModel
        profileView.profileViewModel.coordinator = self
        profileView.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "n_profile"), selectedImage: UIImage(named: "s_profile"))
        navController.pushViewController(profileView, animated: false)
    }
    
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        print(childCoordinators)
        //check viewcontroller when moving from
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        //check viewcontroller array already contains the view controller then it pushing view controller
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
   
        
    }
    
}
