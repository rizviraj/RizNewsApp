//
//  RZ_NewsViewModel.swift
//  RizNewsApp
//
//  Created by Admin on 10/4/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit
import AlamofireImage

class RZ_NewsViewModel {
    
    private var newsModel = RZ_NewsModel()
    
    
    init(_ newsModel : RZ_NewsModel) {
        self.newsModel = newsModel
    }
    
    var nw_author : String {
        return self.newsModel.nw_author
    }
    var nw_content: String {
        return self.newsModel.nw_content
    }
    var nw_description: String {
        return self.newsModel.nw_description ?? ""
    }
    var nw_publishedAt: String {
        return self.newsModel.nw_publishedAt
    }
    var nw_title: String {
        return self.newsModel.nw_title
    }
    var nw_url: String {
        return self.newsModel.nw_url
    }
    var nw_imageUrl: String {
        let image = self.newsModel.nw_imageUrl ?? ""
        return image
    }
    var nw_sourceId: String {
        return self.newsModel.nw_sourceId ?? ""
    }
    var nw_sourceName: String {
        return self.newsModel.nw_sourceName
    }
    
    
}
extension RZ_NewsViewModel {
    /* ==================================================
     Description    :   Configure image with filtered with and height
     Parameters     :   imageview
     Return         :   Nil
     ================================================== */
    func configureCellImage (imageView: UIImageView) {
        if let imageurl = URL(string: self.nw_imageUrl) {
            let filter = AspectScaledToFillSizeFilter(size: (imageView.frame.size))
            imageView.contentMode = .scaleAspectFit
            imageView.af_setImage(withURL: imageurl, placeholderImage: UIImage.init(named: "placeholder"), filter: filter, completion: { (response) in
                imageView.contentMode = .scaleToFill
            })
        }else{
            imageView.image = UIImage.init(named: "placeholder")
            imageView.contentMode = .scaleAspectFit
        }
    }
}
