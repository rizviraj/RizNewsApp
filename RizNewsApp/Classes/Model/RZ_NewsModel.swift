//
//  RZ_NewsModel.swift
//  RizNewsApp
//
//  Created by Admin on 10/4/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit

class RZ_NewsModel: NSObject {

    var nw_author : String!
    var nw_content: String!
    var nw_description: String!
    var nw_publishedAt: String!
    var nw_title: String!
    var nw_url: String!
    var nw_imageUrl: String!
    var nw_sourceId: String!
    var nw_sourceName: String!
    
    class func NewsInfo(eNews: [AnyHashable: Any]) -> RZ_NewsModel {
        let myNews = RZ_NewsModel()
        
        if let nAuthor = eNews["author"] as? String {
            myNews.nw_author = nAuthor
        }
        if let nContent = eNews["content"] as? String {
            myNews.nw_content = nContent
        }
        if let nDiscription = eNews["description"] as? String {
            myNews.nw_description = nDiscription
        }
        if let nPublished = eNews["publishedAt"] as? String {
            myNews.nw_publishedAt = nPublished
        }
        if let nTitle = eNews["title"] as? String {
            myNews.nw_title = nTitle
        }
        if let nUrl = eNews["url"] as? String {
            myNews.nw_url = nUrl
        }
        if let nImage = eNews["urlToImage"] as? String {
            myNews.nw_imageUrl = nImage
        }
        if let nSource = eNews["source"] as? [AnyHashable: Any] {
            if let nID = nSource["id"] as? String {
                myNews.nw_sourceId = nID
            }
            if let nName = nSource["name"] as? String {
                myNews.nw_sourceName = nName
            }
        }
        
        return myNews
    }
    
    class func ProcessNewsInfo(newsArray: Array<Any>) -> [RZ_NewsModel] {
        var newsModel = [RZ_NewsModel]()
        for eHNews in newsArray as [AnyObject]{
            let newsInfo = RZ_NewsModel.NewsInfo(eNews: eHNews as! [AnyHashable : Any])
            newsModel.append(newsInfo)
        }
        return newsModel
    }

    
}
