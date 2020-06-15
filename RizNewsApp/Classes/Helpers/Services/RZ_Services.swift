//
//  RZ_Services.swift
//  RizNewsApp
//
//  Created by Admin on 10/4/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit
import Alamofire

class RZ_Services: NSObject {
    
    /* ==================================================
     Description    :   Call this part to check weather the intenet is active when requesing APIs
     Parameters     :   nil
     Return         :   true / false
     ================================================== */
    class func isConnectedToNetwork() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    /* ==================================================
     Description    :   Call this service to get news data from APIs
     Parameters     :   Dictionary
     Return         :   Data Response
     ================================================== */
    class func GetNewsList(withData dataDict: [AnyHashable: Any], withCallback callback: @escaping (_ success : Bool, _ message: String, _ responseArray : [RZ_NewsModel]) -> Void) {
        var newsModel = [RZ_NewsModel]()
        if !self.isConnectedToNetwork(){
            callback(false, RZ_Constant.RZ_Error_Messages.NO_INTERNET, newsModel)
            return;
        }
        
        let aURL = dataDict["newurl"] as! String
        
        RZ_GeneralService.RZBaseRequest(withData: dataDict, urlString: aURL, httpMethod: HTTPMethod.get, withCallback: {(_ response : DataResponse<Any>) -> Void in
                // print(response)
            if response.response?.statusCode  == 200 {
                if let jsonDict = response.result.value as? [String: Any]  {
                    if jsonDict["status"] as? String == "ok" {
                        if let responseArray = jsonDict["articles"] as? Array<Any> {
                            newsModel = RZ_NewsModel.ProcessNewsInfo(newsArray: responseArray)
                            callback(true, "", newsModel)
                        }else{
                            callback(false, RZ_Constant.RZ_Error_Messages.WENT_WRONG, newsModel)
                        }
                    }else{
                        callback(false, jsonDict["message"] as! String , newsModel)
                    }
                }else{
                    callback(false, RZ_Constant.RZ_Error_Messages.TRY_AGAIN, newsModel)
                }
            }else{
                callback(false, RZ_Constant.RZ_Error_Messages.TRY_AGAIN, newsModel)
            }
        })
    }
    

}
