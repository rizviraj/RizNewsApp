//
//  RZ_NewsTableCell.swift
//  RizNewsApp
//
//  Created by Admin on 10/4/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit

class RZ_NewsTableCell: RZ_BaseCell {

    static let identifier = "CellID"

    var cellMainView = UIView()
    var cellImage = UIImageView()
    var cellTitle = UILabel()
    var cellSource = UILabel()
    var cellDate = UILabel()
    
    var newsViewModel: RZ_NewsViewModel?{
        didSet {
            self.newsViewModel?.configureCellImage(imageView: self.cellImage)
            self.cellTitle.text = self.newsViewModel?.nw_title
            self.cellSource.text = self.newsViewModel?.nw_sourceName
            
            let date = RZ_Utility.RZ_Common.StringToDate(stringDate: self.newsViewModel!.nw_publishedAt)
            self.cellDate.text = RZ_Utility.RZ_DateFormatter.TimeAgoSinceDate(date)
        }
    }
    
    override func setupViews() {
        self.setupUIControls()
    }
}


