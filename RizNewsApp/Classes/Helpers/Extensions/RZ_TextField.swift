//
//  RZ_TextField.swift
//  RizNewsApp
//
//  Created by Admin on 10/6/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//



import UIKit

extension UITextField {
    
    /* ==================================================
     Description    :   Use this method to mention textfield padding left
     Parameters     :   cgfloat
     Return         :   Nil
     ================================================== */
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    /* ==================================================
     Description    :   Use this method to mention padding right
     Parameters     :   cgfloat
     Return         :   Nil
     ================================================== */
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
