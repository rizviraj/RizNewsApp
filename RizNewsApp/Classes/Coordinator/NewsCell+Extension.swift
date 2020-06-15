//
//  NewsCell+Extension.swift
//  RizNewsApp
//
//  Created by Mohamed Rizvi on 6/15/20.
//  Copyright © 2020 RizviOrganization. All rights reserved.
//

import UIKit

/* ==================================================
 To manage autolayout and constraints
 ================================================== */
extension RZ_NewsTableCell {
    
    func setupUIControls () {
        self.removeUIObjects()
        self.setupUI()
        self.contentView.backgroundColor = UIColor(RZ_Constant.RZ_Colors.APP_THEME_COLOR)
        self.contentView.addSubview(self.cellMainView)
        self.cellMainView.addSubview(self.cellImage)
        self.cellMainView.addSubview(self.cellTitle)
        self.cellMainView.addSubview(self.cellSource)
        self.cellMainView.addSubview(self.cellDate)
        self.setupConstraints()
    }
    private func setupUI() {
        
        self.cellMainView = {
            let view = UIView()
            view.backgroundColor = UIColor(RZ_Constant.RZ_Colors.APP_WHITE_BACKGROUND)
            return view
        }()
        self.cellImage = {
            let imgView = UIImageView()
            //imgView.backgroundColor = UIColor(EA_Constant.EA_Colors.IMAGE_BACKGROUND)
            imgView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
            //imgView.layer.cornerRadius = 40
            imgView.clipsToBounds = true
            return imgView
        }()
        self.cellTitle = {
            let label = UILabel()
            label.textAlignment = .left
            label.textColor = UIColor(RZ_Constant.RZ_Colors.TITLE_BLUE)
            label.font = UIFont(name: RZ_Constant.RZ_Strings.APP_FONT_NAME, size: 18)
            label.backgroundColor = UIColor.white
            label.numberOfLines = 0
            return label
        }()
        self.cellSource = {
            let label = UILabel()
            label.textAlignment = .left
            //label.textColor = UIColor.gray
            label.textColor = UIColor(RZ_Constant.RZ_Colors.TEXT_GRAY)
            label.font = UIFont(name: RZ_Constant.RZ_Strings.APP_FONT_NAME, size: 16)
            return label
        }()
        self.cellDate = {
            let label = UILabel()
            label.textAlignment = .right
            label.textColor = UIColor(RZ_Constant.RZ_Colors.TEXT_GRAY)
            label.font = UIFont(name: RZ_Constant.RZ_Strings.APP_FONT_NAME, size: 16)
            return label
        }()
        
    }
    private func setupConstraints (){
        self.cellMainView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.contentView.snp.top).offset(0)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(0)
            make.left.equalTo(self.contentView.snp.left).offset(15)
            make.right.equalTo(self.contentView.snp.right).offset(-15)
        }
        self.cellImage.snp.makeConstraints { (make) -> Void in
            //make.top.equalTo(self.cellMainView.snp.top).offset(5)
            make.top.greaterThanOrEqualTo(self.cellMainView.snp.top).offset(5)
            //make.bottom.equalTo(self.cellMainView.snp.bottom).offset(-5)
            make.left.equalTo(self.cellMainView.snp.left).offset(0)
            make.bottom.lessThanOrEqualTo(self.cellMainView.snp.bottom).offset(-5)
            make.centerY.equalTo(self.cellMainView)
            //make.top.left.bottom.equalTo(self.cellMainView).offset(0)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        self.cellTitle.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.cellMainView.snp.top).offset(10)
            make.left.equalTo(self.cellImage.snp.right).offset(10)
            make.right.equalTo(self.cellMainView.snp.right).offset(0)
        }
        self.cellSource.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.cellTitle.snp.bottom).offset(5)
            make.left.equalTo(self.cellImage.snp.right).offset(10)
            //make.right.equalTo(self.cellMainView.snp.right).offset(0)
            make.bottom.equalTo(self.cellMainView.snp.bottom).offset(-5)
            make.height.equalTo(25)
        }
        self.cellDate.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.cellTitle.snp.bottom).offset(5)
            make.left.equalTo(self.cellSource.snp.right).offset(10)
            make.right.equalTo(self.cellMainView.snp.right).offset(0)
            make.bottom.equalTo(self.cellMainView.snp.bottom).offset(-5)
            make.height.equalTo(25)
        }
    }
    
    private func removeUIObjects(){
        self.cellMainView.removeFromSuperview()
    }
}

