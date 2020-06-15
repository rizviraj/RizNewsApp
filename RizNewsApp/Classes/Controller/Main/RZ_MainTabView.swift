//
//  RZ_MainTabView.swift
//  RizNewsApp
//
//  Created by Mohamed Rizvi on 6/14/20.
//  Copyright © 2020 RizviOrganization. All rights reserved.
//

import UIKit

class RZ_MainTabView: UITabBarController {

    let homeView = HomeCoordinator(UINavigationController())
    let favourite = FavouriteCoordinator(UINavigationController())
    let profile = ProfileCoordinator(UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeView.start()
        favourite.start()
        profile.start()
        
        viewControllers = [homeView.navController, favourite.navController, profile.navController]
    }
  

}
