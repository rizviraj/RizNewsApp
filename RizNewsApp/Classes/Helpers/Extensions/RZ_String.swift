//
//  RZ_String.swift
//  RizNewsApp
//
//  Created by Admin on 10/7/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit

extension String {
    
    func IsValidEmail() -> Bool {
        let emailRegEx = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func IsValidString() -> Bool {
        return self.count > 2
    }
    
    func IsValidPassword () -> Bool {
        return self.count > 2
    }

}
