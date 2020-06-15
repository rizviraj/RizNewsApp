//
//  RZ_Messages.swift
//  RizNewsApp
//
//  Created by Admin on 10/5/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit
import SwiftMessages

class RZ_Messages {
    
    class RZ_Allert_Messages{
        
        /* ==================================================
         Description    :   Use this to show alert in navigation bar
         ================================================== */
        class func MessageOnNavigationBar(_ description : String,_ themeStyle: Theme?) {
            DispatchQueue.main.async(execute: {() -> Void in
                if description.count != 0 {
                    let aSwiftMessage = MessageView.viewFromNib(layout: .tabView)
                    aSwiftMessage.configureTheme(themeStyle!)
                    aSwiftMessage.configureContent(title: "", body: description)
                    aSwiftMessage.button?.isHidden = true
                    var aSwiftMessageConfig = SwiftMessages.defaultConfig
                    aSwiftMessageConfig.presentationStyle = .top
                    aSwiftMessageConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
                    aSwiftMessageConfig.duration = .seconds(seconds: 1.5)
                    SwiftMessages.show(config: aSwiftMessageConfig, view: aSwiftMessage)
                }
            })
        }
    }
    
    /* ==================================================
     Description    :   This is simple alert section.
     ================================================== */
    class RZAlertViews {
        /* ==================================================
         Description    :   You can use this method to alert user for any instant occured
         Parameters     :   message & viewcontroller
         Return         :   nill
         ================================================== */
        
        class func SimpleAlert(_ message: String, _ selfView: UIViewController) {
            let alert = UIAlertController(title: RZ_Constant.RZ_App.APPLICATION_NAME, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            selfView.present(alert, animated: true)
        }
    }
}
