//
//  RZ_NewsWebsite.swift
//  RizNewsApp
//
//  Created by Admin on 10/6/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit
import WebKit
import SwiftMessages

protocol NewsWebViewDelegate: class {
    func manageInitialLoad()
}

class RZ_NewsWebsite: RZ_BaseView {

    var newsViewModel = RZ_NewsViewModel(RZ_NewsModel())
    var newsWebsiteViewModel : RZ_NewsWebsiteViewModel?
    
    var webView = WKWebView()
    var activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialLoadings()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.newsWebsiteViewModel?.delegate?.manageInitialLoad()
    }
    /* ==================================================
     Description    :   Use to load initial stuff
     Parameters     :   Nil
     Return         :   Nil
     ================================================== */
    private func initialLoadings() {
        self.navigationController?.delegate = self
        self.navigationItem.title = self.newsViewModel.nw_sourceName
        self.setupUIControls()
        
        self.loadWebViw()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.activityIndicator)
        self.activityIndicator.startAnimating()
    }

    /* ==================================================
     Description    :   Use this method to load website
     ================================================== */
    private func loadWebViw (){
        if let url = NSURL(string: self.newsViewModel.nw_url) {
            let request = NSURLRequest(url: url as URL)
            webView.load(request as URLRequest)
        }
    }
    
    /* ==================================================
     Description    :   WKwebview delegate emthods
     ================================================== */
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.activityIndicator.startAnimating()
    }
    
}
