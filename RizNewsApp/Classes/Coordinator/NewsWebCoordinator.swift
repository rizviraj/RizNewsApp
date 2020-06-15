//
//  NewsWebCoordinator.swift
//  RizNewsApp
//
//  Created by Mohamed Rizvi on 6/14/20.
//  Copyright © 2020 RizviOrganization. All rights reserved.
//

import UIKit

class NewsWebCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    
    var navController: UINavigationController
    
    var newsViewModel: RZ_NewsViewModel?
    
    init (_ navigationController: UINavigationController){
        self.navController = navigationController
    }
    
    func start() {
        let newsWebsiteViewModel = RZ_NewsWebsiteViewModel()
        let newsWebview = RZ_NewsWebsite()
        newsWebview.newsWebsiteViewModel = newsWebsiteViewModel
        newsWebview.newsWebsiteViewModel?.coordinator = self
        newsWebview.newsWebsiteViewModel?.delegate = self as? NewsWebViewDelegate
        newsWebview.newsViewModel = self.newsViewModel!
        newsWebview.view.backgroundColor = UIColor(RZ_Constant.RZ_Colors.APP_THEME_COLOR)
        navController.pushViewController(newsWebview, animated: false)
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
