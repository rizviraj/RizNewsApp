//
//  RZ_NewsWebsiteEX.swift
//  RizNewsApp
//
//  Created by Admin on 10/6/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit
import WebKit

/* ==================================================
 To manage autolayout and constraints
 ================================================== */
extension RZ_NewsWebsite: WKNavigationDelegate , UINavigationControllerDelegate{
    
    /* ==================================================
     To manage navigation bar
     ================================================== */
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool){
        self.navigationController?.isNavigationBarHidden = false
        navigationController.setNeedsStatusBarAppearanceUpdate()
        navigationController.navigationBar.barTintColor = UIColor(RZ_Constant.RZ_Colors.APP_GREEN_BACKGROUND)
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(RZ_Constant.RZ_Colors.APP_THEME_COLOR) as Any]
        navigationController.navigationBar.tintColor = UIColor(RZ_Constant.RZ_Colors.APP_THEME_COLOR)
        navigationController.navigationBar.isTranslucent = false
    }
    
    
    func setupUIControls(){
        self.removeUIObjects()
        self.setupUI()
        self.view.addSubview(self.webView)
        self.setupUIConstraints()
    }
    fileprivate func setupUI (){
        self.webView = {
            let wview = WKWebView()
            wview.navigationDelegate = self
            wview.backgroundColor = UIColor(RZ_Constant.RZ_Colors.APP_THEME_COLOR)
            return wview
        }()
    }
    
    fileprivate func setupUIConstraints () {
        
        self.webView.snp.makeConstraints{ (make) -> Void in
            make.left.right.top.bottom.equalTo(self.view).offset(0)
        }
        
    }
    
    private func removeUIObjects(){
        self.webView.removeFromSuperview()
    }
    
}

