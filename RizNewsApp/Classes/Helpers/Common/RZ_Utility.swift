//
//  RZ_Utility.swift
//  RizNewsApp
//
//  Created by Admin on 10/4/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import Foundation

class RZ_Utility {
    
    class RZ_CommonUtility {
        
        class func StartAnimating(){
            let activityIndicator = RZ_ActivityIndicatorView()
            activityIndicator.StartActivityAnimating()
        }
        
        class func StopAnimating(){
            let activityIndicator = RZ_ActivityIndicatorView()
            activityIndicator.StopActivity()
        }
        
        class func IsAnimating() -> Bool  {
            let activityIndicator = RZ_ActivityIndicatorView()
            return activityIndicator.CheckAnimating()
        }
        
    }
    
    class RZ_User_Default {
        
        class func SaveLogedIN (_ logedin: Bool) {
            UserDefaults.standard.set(logedin, forKey: RZ_Constant.RZ_Strings.LUSER_OGEDIN)
            UserDefaults.standard.synchronize()
        }
        class func GetLogedIN () -> Bool {
            let logedin = UserDefaults.standard.bool(forKey: RZ_Constant.RZ_Strings.LUSER_OGEDIN)
            return logedin
        }
        class func SaveUserToken (_ token: Int) {
            UserDefaults.standard.setValue(token, forKey: RZ_Constant.RZ_Strings.USER_TOKEN)
            UserDefaults.standard.synchronize()
        }
        class func GetUserToken () -> Int{
            let userToken = UserDefaults.standard.integer(forKey: RZ_Constant.RZ_Strings.USER_TOKEN)
            return userToken
        }
    }
    
    class RZ_Common {
        class func StringToDate (stringDate: String) -> Date{
            let dateFormatter = ISO8601DateFormatter()
            let date = dateFormatter.date(from:stringDate)!
            return date
        }
        class func IsValidString(string: String) -> Bool {
            return string.count > 5
        }
        class func IsValidPassword (password: String) -> Bool {
            return password.count > 2
        }
    }
    class RZ_DateFormatter {
        
        class func TimeAgoSinceDate(_ aDate: Date) -> String {
            
            let aCalendar = Calendar.current
            let now = Date()
            let calendarUnits: NSCalendar.Unit = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
            let components = (aCalendar as NSCalendar).components(calendarUnits, from: aDate, to: now, options: [])
            
            if let year = components.year, year >= 2 {
                return "\(year) years ago"
            }
            if let year = components.year, year >= 1 {
                return "Last year"
            }
            if let month = components.month, month >= 2 {
                return "\(month) months ago"
            }
            if let month = components.month, month >= 1 {
                return "Last month"
            }
            if let week = components.weekOfYear, week >= 2 {
                return "\(week) weeks ago"
            }
            if let week = components.weekOfYear, week >= 1 {
                return "Last week"
            }
            if let day = components.day, day >= 2 {
                return "\(day) days ago"
            }
            if let day = components.day, day >= 1 {
                return "Yesterday"
            }
            if let hour = components.hour, hour >= 2 {
                return "\(hour) hours ago"
            }
            if let hour = components.hour, hour >= 1 {
                return "An hour ago"
            }
            if let minute = components.minute, minute >= 2 {
                return "\(minute) minutes ago"
            }
            if let minute = components.minute, minute >= 1 {
                return "A minute ago"
            }
            if let second = components.second, second >= 3 {
                return "\(second) seconds ago"
            }
            return "Just now"
        }
        
    }
}
