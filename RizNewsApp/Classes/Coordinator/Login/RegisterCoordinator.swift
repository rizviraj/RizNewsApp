//
//  RegisterCoordinator.swift
//  RizNewsApp
//
//  Created by Mohamed Rizvi on 6/14/20.
//  Copyright © 2020 RizviOrganization. All rights reserved.
//

import UIKit

class RegisterCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    
    var navController: UINavigationController
    
    init(_ navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let registerViewModel = RZ_RegisterViewModel()
        let register = RZ_RegisterView()
        register.registerViewModel = registerViewModel
        register.registerViewModel?.coordinator = self
        navController.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        register.view.backgroundColor = UIColor(RZ_Constant.RZ_Colors.APP_THEME_COLOR)
        navController.pushViewController(register, animated: true)
    }
    
    
}
