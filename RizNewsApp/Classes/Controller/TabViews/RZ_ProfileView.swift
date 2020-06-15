//
//  RZ_ProfileView.swift
//  RizNewsApp
//
//  Created by Admin on 10/4/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit
import SwiftMessages
import RxSwift
import RxCocoa


class RZ_ProfileView: RZ_BaseView {
    
    var profileViewModel = RZ_ProfileViewModel()

    var backgroundView = UIView()
    var profileImage = UIImageView()
    var name = UILabel()
    var username = UILabel()
    var email = UILabel()
    var city = UILabel()
    
    var usernameTitle = UILabel()
    var emailTitle = UILabel()
    var cityTitle = UILabel()
    
    let customButton = UIButton(type: .system)

    
    override func viewDidLoad() {
        self.navigationController?.delegate = self

        super.viewDidLoad()
        self.ISNotLoggedIN()

        self.initialLoadings()
    }
    
    /* ==================================================
     Description    :   Load initial stuff
     Parameters     :   Nil
     Return         :   Nil
     ================================================== */
    private func initialLoadings() {
        self.setupUIControls()
        
        customButton.setImage(UIImage(named: "logout"), for: .normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: customButton)
        customButton.rx.tap.bind {
                self.logOut()
        }.disposed(by: profileViewModel.disposeBag)
        
        self.getUserInfo()
    }
    /* ==================================================
     Description    :   Used to get user profile details from databse
     Parameters     :   Nil
     Return         :   Nil
     ================================================== */
    private func getUserInfo () {
        let userid = RZ_Utility.RZ_User_Default.GetUserToken()
        let userModel = self.realm.objects(RZ_UserModel.self).filter("id = \(userid)").first

        if let userModel = userModel {
            self.name.text = userModel.name
            self.username.text = userModel.username
            self.email.text = userModel.email
            self.city.text = userModel.city
        }else{
            RZ_Messages.RZ_Allert_Messages.MessageOnNavigationBar(RZ_Constant.RZ_Error_Messages.NO_USERINFO_FOUND, Theme.error)
        }
    }
    /* ==================================================
     Description    :   Used to logout from the user
     Parameters     :   Nil
     Return         :   Nil
     ================================================== */
    @objc func logOut () {
        self.profileViewModel.simpleAlert(RZ_Constant.RZ_Strings.LOG_OUT, self)
    }
    

}


