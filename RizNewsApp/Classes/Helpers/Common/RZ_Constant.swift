//
//  RZ_Constant.swift
//  RizNewsApp
//
//  Created by Admin on 10/4/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit

class RZ_Constant {
    
    struct RZ_App {
        
        static let APPLICATION_NAME                 = "RizNewsApp"
        
        static let BASE_URL                         = "https://newsapi.org/v2/"
        
        static let API_KEY                          = "aef47fd6c6874864af257747acbecbee"
        
        
    }
    
    struct RZ_Error_Messages {
        
        static let WIFI_EXIST                   = "Wifi Network found"
        
        static let DATA_EXIST                   = "Celular Network found"
        
        static let NO_INTERNET                  = "Please check the internet connection!"
        
        static let TRY_AGAIN                    = "Please try again"
        
        static let WENT_WRONG                   = "Something went wrong"
        
        static let USERNAME_EXIST               = "Username already exist"
        
        static let EMIAL_EXIST                  = "Email already exist"
        
        static let INVALID_LOGIN                = "Invalid username or password"
        
        static let NO_USERINFO_FOUND            = "No user infomation found"
        
        static let INVALID_EMAIL                = "Please check your email"
        
        static let INVALID_INPUT                = "Please check your details"
        
    }
    
    struct RZ_Colors {
        static let APP_THEME_COLOR              =  "#F2F9FF"
        
        static let APP_WHITE_BACKGROUND         =  "#ffffff"
        
        static let APP_GREEN_BACKGROUND         = "#008080"
        
        static let IMAGE_BACKGROUND             =  "#eaeaee"
        
        static let TEXT_GRAY                    = "#808080"
        
        static let TEXT_DARK_GRAY               = "#708090"
        
        static let TITLE_DARK_GREEN             = "#008080"
        
        static let TITLE_BLUE                   = "#2D708D"
        
        static let TITLE_SCREEN_NAME            = "#7F868A"
    }
    
    struct RZ_Strings {
        
        static let APP_LIST_VIEW                    = "List View"
        
        static let APP_FONT_NAME                    = "Helvetica Neue"
        
        static let WEB_LOAD_FAIL                    = "Website Loading failed"
        
        static let LOG_OUT                          = "Are you sure! you want to log out"
        
        static let LUSER_OGEDIN                         = "logedin"
        
        static let USER_TOKEN                            = "usertoken"
        
    }
    
    struct RZ_Arrays {
         
        static let FAVOURITE_NEWS                   = ["Bitcoin", "Apple", "Earthquake", "Animal"]
    }

}
