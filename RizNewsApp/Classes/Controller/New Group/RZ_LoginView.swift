//
//  RZ_LoginView.swift
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


class RZ_LoginView: RZ_BaseView {

    var loginViewModel: RZ_LoginViewModel?

    var loginSubView = UIView()
    var logo = UIImageView()
    var username = UITextField()
    var password = UITextField()
    var loginButton = UIButton()
    var registerButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialLoadings()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.delegate = self
    }
    private func initialLoadings() {
        self.setupUIControls()
        
        loginViewModel?.setTextFieldLeftPadding(self.username)
        loginViewModel?.setTextFieldLeftPadding(self.password)
        
        self.loginButton.rx.tap.bind {
            self.login()
            }.disposed(by: loginViewModel!.disposeBag)
        
        self.registerButton.rx.tap.bind {
            self.goToRegister()
            }.disposed(by: loginViewModel!.disposeBag)
    }
    /* ==================================================
     Description    :   Use this method to login
     ================================================== */
    @objc func login ()  {
    
        if !self.username.text!.IsValidString() || !self.password.text!.IsValidString() {
            RZ_Messages.RZ_Allert_Messages.MessageOnNavigationBar(RZ_Constant.RZ_Error_Messages.INVALID_INPUT, Theme.error)
            return
        }
        self.StartAnimating()
        self.processLogin(username: self.username.text!, password: self.password.text!)
    }
    /* ==================================================
     Description    :   Move to registration view
     ================================================== */
  
    func goToRegister () {
        loginViewModel?.coordinator?.goToRegister()
    }

    /* ==================================================
     Description    :   Use this method to process login
     Parameters     :   username, password
     Return         :   Nil
     ================================================== */
    func processLogin (username: String, password: String) {
        var userModel: RZ_UserModel?
        
        let delay = 0.30
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            userModel = self!.realm.objects(RZ_UserModel.self).filter("username = '\(username)' && password = '\(password)'").first
            
            if userModel != nil {
                self!.StopAnimating()
                
                RZ_Utility.RZ_User_Default.SaveLogedIN(true)
                RZ_Utility.RZ_User_Default.SaveUserToken(userModel!.id)
                self!.ISLoggedIN()
            }else{
                self!.StopAnimating()
                RZ_Messages.RZ_Allert_Messages.MessageOnNavigationBar(RZ_Constant.RZ_Error_Messages.INVALID_LOGIN, Theme.error)
            }
        }
    }

}

