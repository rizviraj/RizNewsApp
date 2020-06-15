//
//  LoginCoordinator.swift
//  RizNewsApp
//
//  Created by Mohamed Rizvi on 6/14/20.
//  Copyright © 2020 RizviOrganization. All rights reserved.
//

import Foundation
import UIKit

class LoginCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    var childCoordinators = [Coordinator]()
    
    var navController: UINavigationController
    
    init(_ navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        navController.delegate = self
        let loginViewModel = RZ_LoginViewModel()
        let login = RZ_LoginView()
        login.loginViewModel = loginViewModel
        //login.coordinator = self
        login.loginViewModel?.coordinator = self
        login.view.backgroundColor = UIColor(RZ_Constant.RZ_Colors.APP_THEME_COLOR)
        navController.pushViewController(login, animated: true)
    }
    
    func goToRegister () {
        let child = RegisterCoordinator(navController)
        childCoordinators.append(child)
        child.start()
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
        //if the homeview controller still here then poping view controller
        if let registerView = fromViewController as? RZ_RegisterView {
            childDidFinish(registerView.registerViewModel?.coordinator)
        }
        
    }
    
}
