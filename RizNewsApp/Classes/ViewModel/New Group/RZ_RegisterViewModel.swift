//
//  RZ_RegisterViewModel.swift
//  RizNewsApp
//
//  Created by Admin on 10/6/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit
import RealmSwift
import RxSwift
import RxCocoa

class RZ_RegisterViewModel {
    
    weak var coordinator: RegisterCoordinator?
    let disposeBag = DisposeBag()
    
    /* ==================================================
     Description    :   Use this method to get user id for new user
     Parameters     :   realm
     Return         :   int
     ================================================== */
    func getUserID(realm: Realm) -> Int{
        if let retNext = realm.objects(RZ_UserModel.self).sorted(byKeyPath: "id", ascending: false).first?.id {
            return retNext + 1
        }else{
            return 1
        }
    }
    /* ==================================================
     Description    :   Use this method to check username is exist in the database
     Parameters     :   username, realm
     Return         :   bool
     ================================================== */
    func checkUsernameExist (username: String, realm: Realm) -> Bool{
        if (realm.objects(RZ_UserModel.self).filter("username = '\(username)'").first?.id) != nil {
            return true
        }else{
            return false
        }
    }
    /* ==================================================
     Description    :   Use this method to check email is exist
     Parameters     :   email, realm
     Return         :   Nil
     ================================================== */
    func checkEmailExist (email: String, realm: Realm) -> Bool{
        if (realm.objects(RZ_UserModel.self).filter("email = '\(email)'").first?.id) != nil {
            return true
        }else{
            return false
        }
    }
    
    func setTextFieldLeftPadding (_ text: UITextField) {
        text.setLeftPaddingPoints(10)
    }
}
