//
//  RZ_GeneralService.swift
//  RizNewsApp
//
//  Created by Admin on 10/4/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit
import Alamofire

class RZ_GeneralService: NSObject {

    /* ==================================================
     Description    :   You can call this service for POST & GET for any specific conditions Eg Keep toekn valid always
     Parameters     :   Dictionary
     Return         :   Data Response
     ================================================== */
    class func RZBaseRequest(withData dataDict: [AnyHashable: Any], urlString : String, httpMethod : HTTPMethod , withCallback callback: @escaping (_ response : DataResponse<Any>) -> Void) {
        
        Alamofire.request(urlString, method: httpMethod, parameters: dataDict as? Parameters).responseJSON { response in
            callback(response)
        }
    }
}
