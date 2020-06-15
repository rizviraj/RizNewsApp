//
//  NewsDetailCoordinator.swift
//  RizNewsApp
//
//  Created by Mohamed Rizvi on 6/14/20.
//  Copyright © 2020 RizviOrganization. All rights reserved.
//

import UIKit

protocol DidFinishNewsDetailDelegate {
    func removeChildCoordinators(_ coordinator: Coordinator)
}

class NewsDetailCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    
    var navController: UINavigationController
    var newsViewModel: RZ_NewsViewModel?
    
    var delegate : DidFinishNewsDetailDelegate?
    
    init (_ navigationController: UINavigationController){
        self.navController = navigationController
    }
    
    func start() {
        let newsDetailViewModel = RZ_NewsDetailViewModel()
        let detailView = RZ_NewsDetailView()
        detailView.newsDetailViewModel = newsDetailViewModel
        detailView.newsDetailViewModel?.coordinator = self
        detailView.newsDetailViewModel?.delegate = self as? NewsDetailViewDelegate
        detailView.newsViewModel = newsViewModel!
        detailView.view.backgroundColor = UIColor(RZ_Constant.RZ_Colors.APP_THEME_COLOR)
        navController.pushViewController(detailView, animated: false)
        
    }
    /*----------------==========--------------------//
     Move to news webview
     ----------------==========--------------------*/
    func newsWebView (_ newsViewModel: RZ_NewsViewModel) {
        let child = NewsWebCoordinator(navController)
        child.newsViewModel = newsViewModel
        child.start()
        delegate?.removeChildCoordinators(child)
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
