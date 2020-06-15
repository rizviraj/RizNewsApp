//
//  RZ_NewsDetailViewEX.swift
//  RizNewsApp
//
//  Created by Admin on 10/6/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit

extension RZ_NewsDetailView: UINavigationControllerDelegate {
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
}

/* ==================================================
 To manage autolayout and constraints
 ================================================== */
extension RZ_NewsDetailView {
    
    func setupUIControls () {
        self.removeUIObjects()
        self.setupUI()
        self.view.backgroundColor = UIColor(RZ_Constant.RZ_Colors.APP_THEME_COLOR)
        self.view.addSubview(self.newsSubView)
        self.newsSubView.addSubview(self.newsImage)
        self.newsSubView.addSubview(self.newsTitle)
        self.newsSubView.addSubview(self.newsDescription)
        self.newsSubView.addSubview(self.newsSource)
        self.newsSubView.addSubview(self.newsDate)
        self.view.addSubview(self.webButton)
        self.setupConstraints()
    }
    private func setupUI() {
        
        self.newsSubView = {
            let view = UIView()
            view.backgroundColor = UIColor(RZ_Constant.RZ_Colors.APP_WHITE_BACKGROUND)
            return view
        }()
        self.newsImage = {
            let imgView = UIImageView()
            imgView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width / 2 + 50)
            imgView.clipsToBounds = true
            
            imgView.backgroundColor = UIColor.gray
            return imgView
        }()
        self.newsTitle = {
            let label = UILabel()
            label.textAlignment = .left
            label.textColor = UIColor(RZ_Constant.RZ_Colors.TITLE_BLUE)
            label.font = UIFont(name: RZ_Constant.RZ_Strings.APP_FONT_NAME, size: 20)
            label.backgroundColor = UIColor.white
            label.numberOfLines = 0
            return label
        }()
        self.newsDescription = {
            let label = UILabel()
            label.textAlignment = .left
            label.textColor = UIColor(RZ_Constant.RZ_Colors.TEXT_DARK_GRAY)
            label.font = UIFont(name: RZ_Constant.RZ_Strings.APP_FONT_NAME, size: 18)
            label.backgroundColor = UIColor.white
            label.numberOfLines = 0
            return label
        }()
        self.newsSource = {
            let label = UILabel()
            label.textAlignment = .left
            //label.textColor = UIColor.gray
            label.textColor = UIColor(RZ_Constant.RZ_Colors.TEXT_GRAY)
            label.font = UIFont(name: RZ_Constant.RZ_Strings.APP_FONT_NAME, size: 16)
            return label
        }()
        self.newsDate = {
            let label = UILabel()
            label.textAlignment = .right
            label.textColor = UIColor(RZ_Constant.RZ_Colors.TEXT_GRAY)
            label.font = UIFont(name: RZ_Constant.RZ_Strings.APP_FONT_NAME, size: 16)
            return label
        }()
        self.webButton = {
            let button = UIButton()
            button.setTitle("Visit Website", for: .normal)
            button.backgroundColor = UIColor(RZ_Constant.RZ_Colors.APP_GREEN_BACKGROUND)
            button.layer.cornerRadius = 5
            button.clipsToBounds = true
            //button.layer.borderWidth = 1
            button.setTitleColor(UIColor(RZ_Constant.RZ_Colors.APP_WHITE_BACKGROUND), for: .normal)
            //button.layer.borderColor = UIColor.green.cgColor
            return button
        }()
        
        
        
    }
    private func setupConstraints (){
        self.newsSubView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp.top).offset(0)
            //make.bottom.equalTo(self.contentView.snp.bottom).offset(0)
            make.left.right.equalTo(self.view).offset(0)
        }
        self.newsImage.snp.makeConstraints { (make) -> Void in
            make.top.left.right.equalTo(self.newsSubView).offset(0)
            make.height.equalTo(self.view.frame.size.width / 2 + 50)
        }
        self.newsTitle.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.newsImage.snp.bottom).offset(15)
            make.left.equalTo(self.newsSubView.snp.left).offset(10)
            make.right.equalTo(self.newsSubView.snp.right).offset(-10)
            make.height.greaterThanOrEqualTo(30)
        }
        self.newsDescription.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.newsTitle.snp.bottom).offset(15)
            make.left.equalTo(self.newsSubView.snp.left).offset(10)
            make.right.equalTo(self.newsSubView.snp.right).offset(-10)
            make.height.greaterThanOrEqualTo(25)
        }
        self.newsSource.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.newsDescription.snp.bottom).offset(20)
            make.left.equalTo(self.newsSubView.snp.left).offset(10)
            make.bottom.equalTo(self.newsSubView.snp.bottom).offset(-15)
            make.height.equalTo(25)
        }
        self.newsDate.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.newsDescription.snp.bottom).offset(10)
            make.left.equalTo(self.newsSource.snp.right).offset(10)
            make.right.equalTo(self.newsSubView.snp.right).offset(-10)
            make.bottom.equalTo(self.newsSubView.snp.bottom).offset(-15)
            make.height.equalTo(25)
        }
        self.webButton.snp.makeConstraints{ (make) -> Void in
            make.height.equalTo(35)
            make.top.equalTo(self.newsSubView.snp.bottom).offset(20)
            make.bottom.lessThanOrEqualTo(self.view.snp.bottom).offset(-50)
            make.left.equalTo(self.view.snp.left).offset(30)
            make.right.equalTo(self.view.snp.right).offset(-30)
        }
        
        
    }
    
    private func removeUIObjects(){
        self.newsSubView.removeFromSuperview()
        self.webButton.removeFromSuperview()
    }
}
