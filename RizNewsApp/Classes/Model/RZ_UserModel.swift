//
//  RZ_UserModel.swift
//  RizNewsApp
//
//  Created by Admin on 10/6/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit
import RealmSwift

class RZ_UserModel: Object {
    @objc dynamic var id = 0
    @objc dynamic var name: String?
    @objc dynamic var username: String?
    @objc dynamic var password: String?
    @objc dynamic var email: String?
    @objc dynamic var city: String?
    @objc dynamic var profileImage: String?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
