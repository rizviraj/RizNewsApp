//
//  RZ_ActivityIndicatorView.swift
//  RizNewsApp
//
//  Created by Admin on 10/5/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


class RZ_ActivityIndicatorView: UIViewController, NVActivityIndicatorViewable {

    var isAnimatingNow: Bool = false
    
    private let presentingIndicatorTypes = {
        return NVActivityIndicatorType.allCases.filter { $0 != .blank }
    }()
    
    func StartActivityAnimating(){
        let indicatorType = presentingIndicatorTypes[5]
        let size = CGSize(width: 30, height: 30)
        startAnimating(size, message: "Loading...", type: indicatorType, fadeInAnimation: nil)
        self.isAnimatingNow = true
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(StopActivity), userInfo: nil, repeats: false)
    }
    
    func StopActivityAnimating(){
        self.stopAnimating(nil)
        self.isAnimatingNow = false
    }
    func CheckAnimating () -> Bool {
        return self.isAnimatingNow
    }
    @objc func StopActivity(){
        self.StopActivityAnimating()
    }

   

}
