//
//  RZ_LoginViewEX.swift
//  RizNewsApp
//
//  Created by Admin on 10/7/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit

/* ==================================================
 To manage autolayout and constraints
 ================================================== */
extension RZ_LoginView : UINavigationControllerDelegate{
    
    /* ==================================================
     To manage navigation bar
     ================================================== */
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool){
        self.navigationController?.isNavigationBarHidden = true
        navigationController.setNeedsStatusBarAppearanceUpdate()
        navigationController.navigationBar.barTintColor = UIColor(RZ_Constant.RZ_Colors.APP_GREEN_BACKGROUND)
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(RZ_Constant.RZ_Colors.APP_THEME_COLOR) as Any]
        navigationController.navigationBar.tintColor = UIColor(RZ_Constant.RZ_Colors.APP_THEME_COLOR)
        navigationController.navigationBar.isTranslucent = false
    }
    /* ==================================================
     Description    :   Use these section to setup UI controls
     Parameters     :   Nil
     Return         :   Nil
     ================================================== */
    func setupUIControls () {
        self.removeUIObjects()
        self.setupUI()
        self.view.backgroundColor = UIColor(RZ_Constant.RZ_Colors.APP_THEME_COLOR)
        self.view.addSubview(self.loginSubView)
        self.loginSubView.addSubview(self.logo)
        self.loginSubView.addSubview(self.username)
        self.loginSubView.addSubview(self.password)
        self.loginSubView.addSubview(self.loginButton)
        self.loginSubView.addSubview(self.registerButton)
        self.setupConstraints()
    }
    private func setupUI() {
        
        self.loginSubView = {
            let view = UIView()
            view.backgroundColor = UIColor(RZ_Constant.RZ_Colors.APP_THEME_COLOR)
            return view
        }()
        self.logo = {
            let imgView = UIImageView()
            imgView.clipsToBounds = true
            imgView.image = UIImage(named: "logo")
            return imgView
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
        self.loginButton = {
            let button = UIButton()
            button.setTitle("Login", for: .normal)
            button.backgroundColor = UIColor(RZ_Constant.RZ_Colors.APP_GREEN_BACKGROUND)
            button.layer.cornerRadius = 5
            button.clipsToBounds = true
            button.setTitleColor(UIColor(RZ_Constant.RZ_Colors.APP_WHITE_BACKGROUND), for: .normal)
            return button
        }()
        self.registerButton = {
            let button = UIButton()
            button.setTitle("Register", for: .normal)
            button.backgroundColor = UIColor(RZ_Constant.RZ_Colors.TITLE_BLUE)
            button.layer.cornerRadius = 5
            button.clipsToBounds = true
            button.setTitleColor(UIColor(RZ_Constant.RZ_Colors.APP_WHITE_BACKGROUND), for: .normal)
            return button
        }()
    }
    private func setupConstraints (){
        self.loginSubView.snp.makeConstraints { (make) -> Void in
            make.centerX.centerY.equalTo(self.view)
            make.left.right.equalTo(self.view).offset(0)
        }
        self.logo.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.loginSubView.snp.top).offset(10)
            make.centerX.equalTo(self.loginSubView)
            make.height.width.equalTo(150)
        }
        self.username.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.logo.snp.bottom).offset(20)
            make.left.equalTo(self.loginSubView.snp.left).offset(30)
            make.right.equalTo(self.loginSubView.snp.right).offset(-30)
            make.height.equalTo(35)
        }
        self.password.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.username.snp.bottom).offset(10)
            make.left.equalTo(self.loginSubView.snp.left).offset(30)
            make.right.equalTo(self.loginSubView.snp.right).offset(-30)
            make.height.equalTo(self.username)
        }
        self.loginButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.password.snp.bottom).offset(10)
            make.left.equalTo(self.loginSubView.snp.left).offset(30)
            make.right.equalTo(self.loginSubView.snp.right).offset(-30)
            make.height.equalTo(self.username)
        }
        self.registerButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.loginButton.snp.bottom).offset(20)
            make.left.equalTo(self.loginSubView.snp.left).offset(30)
            make.right.equalTo(self.loginSubView.snp.right).offset(-30)
            make.height.equalTo(self.username)
            make.bottom.equalTo(self.loginSubView.snp.bottom).offset(-30)
        }
    }
    
    private func removeUIObjects(){
        self.loginSubView.removeFromSuperview()
    }
}
