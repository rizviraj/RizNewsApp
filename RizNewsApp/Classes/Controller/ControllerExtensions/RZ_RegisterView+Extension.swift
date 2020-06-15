//
//  RZ_RegisterViewEX.swift
//  RizNewsApp
//
//  Created by Admin on 10/7/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit

/* ==================================================
 To manage autolayout and constraints
 ================================================== */
extension RZ_RegisterView : UINavigationControllerDelegate{
    
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
        //navigationController.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
    }
    
    func setupUIControls () {
        self.removeUIObjects()
        self.setupUI()
        self.view.backgroundColor = UIColor(RZ_Constant.RZ_Colors.APP_THEME_COLOR)
        self.view.addSubview(self.logo)
        self.view.addSubview(self.name)
        self.view.addSubview(self.username)
        self.view.addSubview(self.password)
        self.view.addSubview(self.email)
        self.view.addSubview(self.city)
        self.view.addSubview(self.registerButton)
        self.setupConstraints()
    }
    private func setupUI() {
        
        self.logo = {
            let imgView = UIImageView()
            imgView.clipsToBounds = true
            imgView.image = UIImage(named: "logo")
            return imgView
        }()
        self.name = {
            let text = UITextField()
            text.textColor = UIColor(RZ_Constant.RZ_Colors.TEXT_DARK_GRAY)
            text.font = UIFont(name: RZ_Constant.RZ_Strings.APP_FONT_NAME, size: 16)
            text.backgroundColor = UIColor.white
            text.layer.cornerRadius = 5
            text.placeholder = "Name"
            return text
        }()
        self.username = {
            let text = UITextField()
            text.textColor = UIColor(RZ_Constant.RZ_Colors.TEXT_DARK_GRAY)
            text.font = UIFont(name: RZ_Constant.RZ_Strings.APP_FONT_NAME, size: 16)
            text.backgroundColor = UIColor.white
            text.layer.cornerRadius = 5
            text.placeholder = "Username"
            text.autocapitalizationType = .none
            return text
        }()
        self.password = {
            let text = UITextField()
            text.textColor = UIColor(RZ_Constant.RZ_Colors.TEXT_DARK_GRAY)
            text.font = UIFont(name: RZ_Constant.RZ_Strings.APP_FONT_NAME, size: 16)
            text.backgroundColor = UIColor.white
            text.layer.cornerRadius = 5
            text.placeholder = "Password"
            text.isSecureTextEntry = true
            return text
        }()
        self.email = {
            let text = UITextField()
            text.textColor = UIColor(RZ_Constant.RZ_Colors.TEXT_DARK_GRAY)
            text.font = UIFont(name: RZ_Constant.RZ_Strings.APP_FONT_NAME, size: 16)
            text.backgroundColor = UIColor.white
            text.layer.cornerRadius = 5
            text.placeholder = "Email"
            text.autocapitalizationType = .none
            return text
        }()
        self.city = {
            let text = UITextField()
            text.textColor = UIColor(RZ_Constant.RZ_Colors.TEXT_DARK_GRAY)
            text.font = UIFont(name: RZ_Constant.RZ_Strings.APP_FONT_NAME, size: 16)
            text.backgroundColor = UIColor.white
            text.layer.cornerRadius = 5
            text.placeholder = "City"
            return text
        }()
        self.registerButton = {
            let button = UIButton()
            button.setTitle("Register", for: .normal)
            button.backgroundColor = UIColor(RZ_Constant.RZ_Colors.APP_GREEN_BACKGROUND)
            button.layer.cornerRadius = 5
            button.clipsToBounds = true
            button.setTitleColor(UIColor(RZ_Constant.RZ_Colors.APP_WHITE_BACKGROUND), for: .normal)
            return button
        }()
    }
    private func setupConstraints (){
        self.logo.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp.top).offset(50)
            make.centerX.equalTo(self.view)
            make.height.width.equalTo(100)
        }
        self.name.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.logo.snp.bottom).offset(20)
            make.left.equalTo(self.view.snp.left).offset(30)
            make.right.equalTo(self.view.snp.right).offset(-30)
            make.height.equalTo(35)
        }
        self.username.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.name.snp.bottom).offset(10)
            make.left.equalTo(self.view.snp.left).offset(30)
            make.right.equalTo(self.view.snp.right).offset(-30)
            make.height.equalTo(self.name)
        }
        self.password.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.username.snp.bottom).offset(10)
            make.left.equalTo(self.view.snp.left).offset(30)
            make.right.equalTo(self.view.snp.right).offset(-30)
            make.height.equalTo(self.name)
        }
        self.email.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.password.snp.bottom).offset(10)
            make.left.equalTo(self.view.snp.left).offset(30)
            make.right.equalTo(self.view.snp.right).offset(-30)
            make.height.equalTo(self.name)
        }
        self.city.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.email.snp.bottom).offset(10)
            make.left.equalTo(self.view.snp.left).offset(30)
            make.right.equalTo(self.view.snp.right).offset(-30)
            make.height.equalTo(self.name)
        }
        self.registerButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.city.snp.bottom).offset(20)
            make.left.equalTo(self.view.snp.left).offset(30)
            make.right.equalTo(self.view.snp.right).offset(-30)
            make.height.equalTo(self.name)
            //make.bottom.equalTo(self.loginSubView.snp.bottom).offset(-30)
        }
    }
    
    private func removeUIObjects(){
        self.logo.removeFromSuperview()
        self.name.removeFromSuperview()
        self.username.removeFromSuperview()
        self.password.removeFromSuperview()
        self.email.removeFromSuperview()
        self.city.removeFromSuperview()
        self.registerButton.removeFromSuperview()
    }
}

