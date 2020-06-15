//
//  RZ_BaseView.swift
//  RizNewsApp
//
//  Created by Admin on 10/4/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit
import RealmSwift

class RZ_BaseView: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    var realm: Realm {
        get {
            do {
                let realm = try Realm()
                return realm
            }
            catch {
                RZ_Messages.RZAlertViews.SimpleAlert("Could not access database: ", self)
            }
            return self.realm
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    /* ==================================================
     Description    :   Used this metho to show activity indicator
     ================================================== */
    func StartAnimating () {
        if !RZ_Utility.RZ_CommonUtility.IsAnimating() {
            RZ_Utility.RZ_CommonUtility.StartAnimating()
        }
    }
    /* ==================================================
     Description    :   Used this metho to stop activity indicator
     ================================================== */
    func StopAnimating () {
        RZ_Utility.RZ_CommonUtility.StopAnimating()

    }
    /* ==================================================
     Description    :   Redirect to the login page if user is not logged in
     ================================================== */
    func ISNotLoggedIN () {
        if !RZ_Utility.RZ_User_Default.GetLogedIN() {
            self.appDelegate.goToLogin()
        }
    }
    /* ==================================================
     Description    :   Redirect to Home page if the user is logged in
     ================================================== */
    func ISLoggedIN () {
        if RZ_Utility.RZ_User_Default.GetLogedIN() {
            self.appDelegate.HomeView()
        }
    }

}
