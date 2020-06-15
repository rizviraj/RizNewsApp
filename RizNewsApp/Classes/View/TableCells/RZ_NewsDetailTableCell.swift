//
//  RZ_NewsDetailTableCell.swift
//  RizNewsApp
//
//  Created by Admin on 10/5/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit

class RZ_NewsDetailTableCell: RZ_BaseCell {

    static let identifier = "DetailCellID"
    
    var cellMainView = UIView()
    var cellImage = UIImageView()
    var cellTitle = UILabel()
    var cellDescription = UILabel()
    var cellSource = UILabel()
    var cellDate = UILabel()
    
    var newsViewModel: RZ_NewsViewModel? {
        didSet {
            //print(self.newsViewModel?.nw_imageUrl)
            
            self.newsViewModel?.configureCellImage(imageView: self.cellImage)
            self.cellTitle.text = self.newsViewModel?.nw_title
            self.cellDescription.text = self.newsViewModel?.nw_description
            self.cellSource.text = self.newsViewModel?.nw_sourceName
            
            let date = RZ_Utility.RZ_Common.StringToDate(stringDate: self.newsViewModel!.nw_publishedAt)
            self.cellDate.text = RZ_Utility.RZ_DateFormatter.TimeAgoSinceDate(date)
        }
    }
    
    override func setupViews() {
        self.setupUIControls()
        self.contentView.backgroundColor = UIColor.green
    }

}
