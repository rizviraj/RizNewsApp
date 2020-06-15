//
//  HomeCoordinator.swift
//  RizNewsApp
//
//  Created by Mohamed Rizvi on 6/14/20.
//  Copyright © 2020 RizviOrganization. All rights reserved.
//

import UIKit

class HomeCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    var childCoordinators = [Coordinator]()
    
    var navController: UINavigationController
    
    init(_ navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        self.navController.delegate = self
        let home = RZ_HomeView()
        home.homeViewModel.coordinator = self
        
        home.view.backgroundColor = UIColor(RZ_Constant.RZ_Colors.APP_THEME_COLOR)
        home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "n_home"), selectedImage: UIImage(named: "s_home"))
        navController.pushViewController(home, animated: false)

    }
    /*----------------==========--------------------//
     Move to news detail view
     ----------------==========--------------------*/
    func newsDetailView (_ newsViewModel: RZ_NewsViewModel) {
        let child = NewsDetailCoordinator(navController)
        child.delegate = self
        child.newsViewModel = newsViewModel
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
        if let detailView = fromViewController as? RZ_NewsDetailView {
            childDidFinish(detailView.newsDetailViewModel?.coordinator)
        }
        if let detailViewWeb = fromViewController as? RZ_NewsWebsite {
            childDidFinish(detailViewWeb.newsWebsiteViewModel?.coordinator)
        }
        
    }
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool){
        navigationController.isNavigationBarHidden = false
        navigationController.setNeedsStatusBarAppearanceUpdate()
        navigationController.navigationBar.barTintColor = UIColor(RZ_Constant.RZ_Colors.APP_GREEN_BACKGROUND)
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(RZ_Constant.RZ_Colors.APP_THEME_COLOR) as Any]
        navigationController.navigationBar.tintColor = UIColor(RZ_Constant.RZ_Colors.APP_THEME_COLOR)
        navigationController.navigationBar.isTranslucent = false
    }
    
}
extension HomeCoordinator: DidFinishNewsDetailDelegate {
    func removeChildCoordinators(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
}
