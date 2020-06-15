//
//  RZ_RegisterView.swift
//  RizNewsApp
//
//  Created by Admin on 10/6/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit
import RealmSwift
import SwiftMessages
import RxSwift
import RxCocoa


class RZ_RegisterView: RZ_BaseView {
    
    var registerViewModel: RZ_RegisterViewModel?

    var logo = UIImageView()
    var name = UITextField()
    var username = UITextField()
    var password = UITextField()
    var email = UITextField()
    var city = UITextField()
    var registerButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialLoadings()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.delegate = self
    }
    /* ==================================================
     Description    :   Used this method to load initial stuff
     ================================================== */
    private func initialLoadings() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        self.setupUIControls()
        
        registerViewModel?.setTextFieldLeftPadding(self.name)
        registerViewModel?.setTextFieldLeftPadding(self.username)
        registerViewModel?.setTextFieldLeftPadding(self.password)
        registerViewModel?.setTextFieldLeftPadding(self.email)
        registerViewModel?.setTextFieldLeftPadding(self.city)
        
        self.registerButton.rx.tap.bind {
            self.register()
            }.disposed(by: registerViewModel!.disposeBag)
    }
    
    /* ==================================================
     Description    :   Registration flow
     Parameters     :   Nil
     Return         :   Nil
     ================================================== */
    @objc func register () {
        if !self.name.text!.IsValidString() || !self.username.text!.IsValidString() || !self.password.text!.IsValidString() || !self.city.text!.IsValidString() {
            RZ_Messages.RZ_Allert_Messages.MessageOnNavigationBar(RZ_Constant.RZ_Error_Messages.INVALID_INPUT, Theme.error)
            return
        }
        if !(self.email.text?.IsValidEmail())! {
            RZ_Messages.RZ_Allert_Messages.MessageOnNavigationBar(RZ_Constant.RZ_Error_Messages.INVALID_EMAIL, Theme.error)
            return
        }
        if self.registerViewModel!.checkUsernameExist(username: self.username.text!, realm: self.realm){
            RZ_Messages.RZ_Allert_Messages.MessageOnNavigationBar(RZ_Constant.RZ_Error_Messages.USERNAME_EXIST, Theme.error)
            return
        }
        if self.registerViewModel!.checkEmailExist(email: self.email.text!, realm: self.realm) {
            RZ_Messages.RZ_Allert_Messages.MessageOnNavigationBar(RZ_Constant.RZ_Error_Messages.EMIAL_EXIST, Theme.error)
            return
        }
        self.StartAnimating()
        self.addNewUser()
    }
    /* ==================================================
     Description    :   Use this method to add user details to local database
     Parameters     :   Nil
     Return         :   Nil
     ================================================== */
    func addNewUser () {
        let newUser = RZ_UserModel()
        newUser.id = self.registerViewModel!.getUserID(realm: self.realm)
        newUser.name = self.name.text
        newUser.username = self.username.text
        newUser.password = self.password.text
        newUser.email = self.email.text
        newUser.city = self.city.text
        newUser.profileImage = ""
        
        let delay = 0.30
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            do {
                try self!.realm.write {
                    self?.StopAnimating()
                    self!.realm.add(newUser)
                    RZ_Utility.RZ_User_Default.SaveLogedIN(true)
                    RZ_Utility.RZ_User_Default.SaveUserToken(newUser.id)
                    
                    self!.appDelegate.HomeView()
                }
            } catch {
                self?.StopAnimating()
                RZ_Messages.RZ_Allert_Messages.MessageOnNavigationBar(RZ_Constant.RZ_Error_Messages.TRY_AGAIN, Theme.error)
            }
        }
    }

}

