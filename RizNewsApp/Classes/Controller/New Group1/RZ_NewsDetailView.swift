//
//  RZ_NewsDetailView.swift
//  RizNewsApp
//
//  Created by Admin on 10/4/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit
import HexColors

protocol NewsDetailViewDelegate: class {
    func manageInitialLoad()
}

class RZ_NewsDetailView: RZ_BaseView, NewsWebViewDelegate {

    var newsDetailViewModel : RZ_NewsDetailViewModel?

    private var newsDetailVM = RZ_NewsDetailViewModel()
    var newsViewModel = RZ_NewsViewModel(RZ_NewsModel())
    
    var newsSubView = UIView()
    var newsImage = UIImageView()
    var newsTitle = UILabel()
    var newsDescription = UILabel()
    var newsSource = UILabel()
    var newsDate = UILabel()
    
    var webButton = UIButton()


    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialLoadings()
    }
    
    /* ==================================================
     Description    :   Load initial stuff
     Parameters     :   Nil
     Return         :   Nil
     ================================================== */
    private func initialLoadings(){
        //self.navigationController?.delegate = self
        
        self.setupUIControls()
        
        self.configureNewsDetails()
        
    }
    /* ==================================================
     Description    :   Configure news detail view
     Parameters     :   Nil
     Return         :   Nil
     ================================================== */
    private func configureNewsDetails(){
        
        self.newsViewModel.configureCellImage(imageView: self.newsImage)
        self.newsTitle.text = self.newsViewModel.nw_title
        self.newsDescription.text = self.newsViewModel.nw_description
        self.newsSource.text = self.newsViewModel.nw_sourceName
        
        let date = RZ_Utility.RZ_Common.StringToDate(stringDate: self.newsViewModel.nw_publishedAt)
        self.newsDate.text = RZ_Utility.RZ_DateFormatter.TimeAgoSinceDate(date)
        
        self.webButton.addTarget(self, action: #selector(loadWeb), for: .touchUpInside)
        
    }
    /* ==================================================
     Description    :   Use this metho to load website in webview
     ================================================== */
    @objc func loadWeb ()  {
        self.newsDetailViewModel?.coordinator?.newsWebView(self.newsViewModel)
        
    }

    func manageInitialLoad() {
        newsDetailViewModel?.delegate?.manageInitialLoad()
        //self.delegate?.manageInitialLoad()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.manageInitialLoad()
        //self.delegate?.ManageInitialLoad()
    }
    
    
}



