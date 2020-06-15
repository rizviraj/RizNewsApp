//
//  RZ_FavouriteView.swift
//  RizNewsApp
//
//  Created by Admin on 10/4/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit
import SwiftMessages
import HexColors
import SnapKit
import FTPopOverMenu_Swift

class RZ_FavouriteView: RZ_BaseView, NewsDetailViewDelegate {

    var newsArray = [RZ_NewsViewModel]()
    var favouriteViewModel = RZ_FavouriteViewModel()
    
    var newsTableView = UITableView()
    
    var isDataLoading = false
    private var pageSize = 15
    private var page = 1
    private var newsKeyword = RZ_Constant.RZ_Arrays.FAVOURITE_NEWS[0]
    private var isInitialLoad = true
    
    let customButton = UIButton(type: .system)

    
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
            self.getFavouriteNews()
        }else{
            self.isInitialLoad = true
        }
        
        customButton.setImage(UIImage(named: "n_favourite"), for: .normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: customButton)
        customButton.addTarget(self, action: #selector(selectSideMenu(sender:)), for: .touchUpInside)
    }
    /* ==================================================
     Description    :   Used this method to load initial items
     Parameters     :   Nil
     Return         :   Nil
     ================================================== */
    private func initialLoadings(){
        self.setupUIControls()
        navigationItem.title = "Favourite News"
    }
    /* ==================================================
     Description    :   Use this method to select favourite new item
     Parameters     :   Nil
     Return         :   Nil
     ================================================== */
    @objc func selectSideMenu (sender: UIButton) {
        FTPopOverMenu.showForSender(sender: sender,
            with: RZ_Constant.RZ_Arrays.FAVOURITE_NEWS,
            done: { (selectedIndex) -> () in
                self.selectFavouriteNews(news: selectedIndex)
        }) {
            
        }
    }
    /* ==================================================
     Description    :   Use this method to process favourtie news item
     Parameters     :   Nil
     Return         :   Nil
     ================================================== */
    private func selectFavouriteNews (news: Int){
        self.newsKeyword = RZ_Constant.RZ_Arrays.FAVOURITE_NEWS[news].lowercased()
        //self.page = 1
        self.setupDefaultItems()
        self.getFavouriteNews()
    }
    /* ==================================================
     Description    :   Use this method to make default setup
     Parameters     :   Nil
     Return         :   Nil
     ================================================== */
    private func setupDefaultItems(){
        self.page = 1
        self.newsArray = [RZ_NewsViewModel]()
        self.favouriteViewModel.newsArray = self.newsArray
        self.favouriteViewModel.newsViewModelObj.accept(self.newsArray)
    }
    /* ==================================================
     Description    :   Used to get favourite news from the api
     Parameters     :   Nil
     Return         :   Nil
     ================================================== */
    private func getFavouriteNews (){
        self.StartAnimating()
        let requestDict = [
            "newurl": "\(RZ_Constant.RZ_App.BASE_URL)everything?q=\(self.newsKeyword)&pageSize=\(self.pageSize)&page=\(self.page)&apiKey=\(RZ_Constant.RZ_App.API_KEY)"
        ]
        
        RZ_Services.GetNewsList(withData: requestDict, withCallback: { (_ success: Bool, message: String, responseObject: [RZ_NewsModel]) -> Void in
            self.StopAnimating()
            
            if success {
                let newsModel = responseObject
                let newsViewModel = newsModel.map({return RZ_NewsViewModel($0)})
                self.newsArray += newsViewModel
                
                self.favouriteViewModel.newsArray = self.newsArray
                self.favouriteViewModel.newsViewModelObj.accept(self.newsArray)
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
     Description    :   Use this method to configure table view and selected items by RxSwift
     Parameters     :   Nil
     Return         :   Nil
     ================================================== */
    private func configureTableView(){
        self.favouriteViewModel.setupTableCell(self.newsTableView)
        self.favouriteViewModel.selectedNewsItem(self, self.newsTableView)
    }
    
    /* ==================================================
     Description    :   Use this protocol method to find Initial load of the page
     Parameters     :   Nil
     Return         :   Nil
     ================================================== */
    func manageInitialLoad(){
        self.isInitialLoad = false
        print("hello Protocol")
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
                self.getFavouriteNews()
                isDataLoading = true
            }
        }
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.isDataLoading = false
    }

   

}
