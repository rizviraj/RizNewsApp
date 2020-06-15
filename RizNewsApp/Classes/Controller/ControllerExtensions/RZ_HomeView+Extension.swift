//
//  RZ_HomeViewEX.swift
//  RizNewsApp
//
//  Created by Admin on 10/6/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit

extension RZ_HomeView: UINavigationControllerDelegate, UIScrollViewDelegate, UITableViewDelegate {
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
extension RZ_HomeView {
    
    func setupUIControls(){
        self.removeUIObjects()
        self.setupUI()
        self.view.addSubview(self.searchBar)
        self.view.addSubview(self.newsTableView)
        self.setupUIConstraints()
    }
    fileprivate func setupUI (){
        self.searchBar = {
            let search = UISearchBar()
            search.placeholder = "Search Car"
            search.backgroundColor = UIColor.white
            //search.delegate = self
            return search
        }()
        self.newsTableView = {
            let tableView = UITableView()
            tableView.backgroundColor = UIColor(RZ_Constant.RZ_Colors.APP_THEME_COLOR)
            tableView.estimatedRowHeight = 50
            tableView.rowHeight = UITableView.automaticDimension
            //tableView.dataSource = self
            tableView.delegate = self
            tableView.register(RZ_NewsTableCell.self, forCellReuseIdentifier: RZ_NewsTableCell.identifier)
            return tableView
        }()
    }
    
    fileprivate func setupUIConstraints () {
        self.searchBar.snp.makeConstraints{ (make) -> Void in
            make.left.right.top.equalTo(self.view).offset(0)
            make.height.equalTo(50)
        }
        self.newsTableView.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.searchBar.snp.bottom).offset(0)
            make.left.right.bottom.equalTo(self.view).offset(0)
        }
        
    }
    
    private func removeUIObjects(){
        self.newsTableView.removeFromSuperview()
    }
    
}
