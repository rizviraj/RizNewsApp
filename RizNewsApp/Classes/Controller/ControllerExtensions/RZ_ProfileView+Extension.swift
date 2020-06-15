//
//  RZ_ProfileViewEX.swift
//  RizNewsApp
//
//  Created by Admin on 10/6/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit

/* ==================================================
 To manage autolayout and constraints
 ================================================== */
extension RZ_ProfileView : UINavigationControllerDelegate{
    
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
    
    func setupUIControls () {
        self.removeUIObjects()
        self.setupUI()
        self.view.backgroundColor = UIColor(RZ_Constant.RZ_Colors.APP_THEME_COLOR)
        self.view.addSubview(self.backgroundView)
        self.backgroundView.addSubview(self.profileImage)
        self.backgroundView.addSubview(self.name)
        self.view.addSubview(self.usernameTitle)
        self.view.addSubview(self.username)
        self.view.addSubview(self.emailTitle)
        self.view.addSubview(self.email)
        self.view.addSubview(self.cityTitle)
        self.view.addSubview(self.city)
        self.setupConstraints()
    }
    private func setupUI() {
        
        self.backgroundView = {
            let view = UIView()
            view.backgroundColor = UIColor(RZ_Constant.RZ_Colors.APP_GREEN_BACKGROUND)
            return view
        }()
        self.profileImage = {
            let imgView = UIImageView()
            imgView.clipsToBounds = true
            imgView.image = UIImage(named: "profile")
            imgView.layer.cornerRadius = 75
            return imgView
        }()
        self.name = {
            let label = UILabel()
            label.textAlignment = .center
            label.textColor = UIColor(RZ_Constant.RZ_Colors.APP_WHITE_BACKGROUND)
            label.font = UIFont(name: RZ_Constant.RZ_Strings.APP_FONT_NAME, size: 24)
            return label
        }()
        self.usernameTitle = {
            let label = UILabel()
            label.textAlignment = .left
            label.textColor = UIColor(RZ_Constant.RZ_Colors.APP_GREEN_BACKGROUND)
            label.font = UIFont(name: RZ_Constant.RZ_Strings.APP_FONT_NAME, size: 18)
            label.text = "Username"
            return label
        }()
        self.username = {
            let label = UILabel()
            label.textAlignment = .left
            label.textColor = UIColor(RZ_Constant.RZ_Colors.TEXT_GRAY)
            label.font = UIFont(name: RZ_Constant.RZ_Strings.APP_FONT_NAME, size: 16)
            return label
        }()
        self.emailTitle = {
            let label = UILabel()
            label.textAlignment = .left
            label.textColor = UIColor(RZ_Constant.RZ_Colors.APP_GREEN_BACKGROUND)
            label.font = UIFont(name: RZ_Constant.RZ_Strings.APP_FONT_NAME, size: 18)
            label.text = "Email"
            return label
        }()
        self.email = {
            let label = UILabel()
            label.textAlignment = .left
            label.textColor = UIColor(RZ_Constant.RZ_Colors.TEXT_GRAY)
            label.font = UIFont(name: RZ_Constant.RZ_Strings.APP_FONT_NAME, size: 16)
            return label
        }()
        self.cityTitle = {
            let label = UILabel()
            label.textAlignment = .left
            label.textColor = UIColor(RZ_Constant.RZ_Colors.APP_GREEN_BACKGROUND)
            label.font = UIFont(name: RZ_Constant.RZ_Strings.APP_FONT_NAME, size: 18)
            label.text = "City"
            return label
        }()
        self.city = {
            let label = UILabel()
            label.textAlignment = .left
            label.textColor = UIColor(RZ_Constant.RZ_Colors.TEXT_GRAY)
            label.font = UIFont(name: RZ_Constant.RZ_Strings.APP_FONT_NAME, size: 16)
            return label
        }()
        
        
    }
    private func setupConstraints (){
        self.backgroundView.snp.makeConstraints { (make) -> Void in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(self.view.frame.size.width / 2 + 70)
        }
        self.profileImage.snp.makeConstraints { (make) -> Void in
            make.centerY.centerX.equalTo(self.backgroundView)
            make.height.width.equalTo(150)
        }
        self.name.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.profileImage.snp.bottom).offset(20)
            make.left.equalTo(self.backgroundView.snp.left).offset(30)
            make.right.equalTo(self.backgroundView.snp.right).offset(-30)
            make.height.equalTo(35)
            make.bottom.lessThanOrEqualTo(self.backgroundView.snp.bottom).offset(-5)
        }
        self.usernameTitle.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.backgroundView.snp.bottom).offset(20)
            make.left.equalTo(self.view.snp.left).offset(30)
            make.right.equalTo(self.view.snp.right).offset(-30)
            make.height.equalTo(30)
        }
        self.username.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.usernameTitle.snp.bottom).offset(5)
            make.left.equalTo(self.view.snp.left).offset(30)
            make.right.equalTo(self.view.snp.right).offset(-30)
            make.height.equalTo(self.usernameTitle)
        }
        self.emailTitle.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.username.snp.bottom).offset(30)
            make.left.equalTo(self.view.snp.left).offset(30)
            make.right.equalTo(self.view.snp.right).offset(-30)
            make.height.equalTo(self.usernameTitle)
        }
        self.email.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.emailTitle.snp.bottom).offset(5)
            make.left.equalTo(self.view.snp.left).offset(30)
            make.right.equalTo(self.view.snp.right).offset(-30)
            make.height.equalTo(self.usernameTitle)
        }
        self.cityTitle.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.email.snp.bottom).offset(30)
            make.left.equalTo(self.view.snp.left).offset(30)
            make.right.equalTo(self.view.snp.right).offset(-30)
            make.height.equalTo(self.usernameTitle)
        }
        self.city.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.cityTitle.snp.bottom).offset(5)
            make.left.equalTo(self.view.snp.left).offset(30)
            make.right.equalTo(self.view.snp.right).offset(-30)
            make.height.equalTo(self.usernameTitle)
        }
    }
    
    private func removeUIObjects(){
        self.backgroundView.removeFromSuperview()
        self.usernameTitle.removeFromSuperview()
        self.username.removeFromSuperview()
        self.emailTitle.removeFromSuperview()
        self.email.removeFromSuperview()
        self.cityTitle.removeFromSuperview()
        self.city.removeFromSuperview()
    }
}

