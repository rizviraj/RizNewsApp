//
//  RZ_ProfileViewModel.swift
//  RizNewsApp
//
//  Created by Admin on 10/6/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RZ_ProfileViewModel {
    
    weak var coordinator : ProfileCoordinator?
    
    let disposeBag = DisposeBag()
    
    /* ==================================================
     Description    :   Use this method to alert user when try to log out
     Parameters     :   message, viewcontroller
     Return         :   Nil
     ================================================== */
    func simpleAlert(_ message: String, _ selfView: UIViewController) {
        let alert = UIAlertController(title: RZ_Constant.RZ_App.APPLICATION_NAME, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes Sure!", style: .default, handler: { action in
            RZ_Utility.RZ_User_Default.SaveLogedIN(false)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.02){
                appDelegate.goToLogin()
            }
        }))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        selfView.present(alert, animated: true)
    }
    
    
}
