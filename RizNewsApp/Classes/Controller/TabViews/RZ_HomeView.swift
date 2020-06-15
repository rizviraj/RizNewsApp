//
//  RZ_HomeView.swift
//  RizNewsApp
//
//  Created by Admin on 10/4/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit
import SnapKit
import HexColors
import SwiftMessages

import RxSwift
import RxCocoa


class RZ_HomeView: RZ_BaseView, NewsDetailViewDelegate {
    
    var newsArray = [RZ_NewsViewModel]()
    var homeViewModel = RZ_HomeViewModel()
    
    var newsTableView = UITableView()
    var searchBar = UISearchBar()
    
    private var isDataLoading = false
    private var pageSize = 15
    private var page = 1
    var isInitialLoad = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialLoadings()
        self.configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //self.navigationController?.delegate = self
        if self.isInitialLoad {
            self.setupDefaultItems()
            self.getNewsHeadlines()
        }else{
            self.isInitialLoad = true
        }
    }
    
    /* ==================================================
     Description    :   Used to load initial stuff
     ================================================== */
    private func initialLoadings(){
        self.setupUIControls()
        
        navigationItem.title = "News Headlines"
        //self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    /* ==================================================
     Description    :   Use this method to make default setup
     Parameters     :   Nil
     Return         :   Nil
     ================================================== */
    private func setupDefaultItems(){
        self.page = 1
        self.newsArray = [RZ_NewsViewModel]()
        self.homeViewModel.newsArray = self.newsArray
        self.homeViewModel.newsViewModelObj.accept(self.newsArray)
    }
    
    /* ==================================================
     Description    :   Used to get news headlines from the api
     Parameters     :   Nil
     Return         :   Nil
     ================================================== */
    private func getNewsHeadlines (){
        self.StartAnimating()
        let requestDict = [
            "newurl": "\(RZ_Constant.RZ_App.BASE_URL)top-headlines?country=us&pageSize=\(self.pageSize)&page=\(self.page)&apiKey=\(RZ_Constant.RZ_App.API_KEY)"
        ]
        
        RZ_Services.GetNewsList(withData: requestDict, withCallback: { (_ success: Bool, message: String, responseObject: [RZ_NewsModel]) -> Void in
            self.StopAnimating()
            
            if success {
                let newsModel = responseObject
                let newsViewModel = newsModel.map({return RZ_NewsViewModel($0)})
                self.newsArray += newsViewModel
                
                self.homeViewModel.newsArray = self.newsArray
                self.homeViewModel.newsViewModelObj.accept(self.newsArray)
            }else{
                if message == RZ_Constant.RZ_Error_Messages.NO_INTERNET{
                    RZ_Messages.RZ_Allert_Messages.MessageOnNavigationBar(message, Theme.warning)
                }else {
                    RZ_Messages.RZ_Allert_Messages.MessageOnNavigationBar(message, Theme.error)
                }
            }
        })
    }

    /* ==================================================
     Description    :   Use to configure table view contents in RxSift
     ================================================== */
    private func configureTableView(){
        self.homeViewModel.setupTableCell(self.newsTableView)
        self.homeViewModel.selectedNewsItem(self, self.newsTableView)
        
        self.homeViewModel.searchNews(self.searchBar)
    }
    
    /* ==================================================
     Description    :   Here do the pagination when scrolling table view
     Parameters     :   Nil
     Return         :   Nil
     ================================================== */
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if ((self.newsTableView.contentOffset.y + self.newsTableView.frame.size.height) >= self.newsTableView.contentSize.height) {
            if !isDataLoading{
                self.page += 1
                self.getNewsHeadlines()
                isDataLoading = true
            }
        }
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.isDataLoading = false
    }
    
    /* ==================================================
     Description    :   Used protocol method to check Initial laod of the page
     ================================================== */
    func manageInitialLoad(){
        self.isInitialLoad = false
    }

}

