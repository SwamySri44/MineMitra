//
//  Datamanger.swift
//  MINE
//
//  Created by Vemulawada Swamy on 27/04/22.
//

import Foundation
import Alamofire
import SwiftyJSON
import KRProgressHUD
class DataManager: NSObject {
class func alamofireGetRequest(url:String,viewcontroller : UIViewController!, parameters:[String:AnyObject]?,forInterAction:Bool ,completionHandler: @escaping (_ data: JSON?, NSError?,_ code:Int) -> ()) {
    print(parameters as Any)
    print(url)
    KRProgressHUD.show()
    if  Utility.isInternetAvailable() == true {
    let header = ["Content-Type": "application/json",
    "accept": "application/json"]
        AF.session.configuration.timeoutIntervalForRequest = 1000
        AF.request(url, method: .get, parameters: [:], encoding: URLEncoding.default, headers: nil).validate().responseJSON{ response in
           switch response.result {
            case .success:
                print(response)
                let data = response.data
                    debugPrint("JSON: \(data)")
                    let jsonObject = JSON(data)
                viewcontroller.view.isUserInteractionEnabled = true
                completionHandler(jsonObject, nil,response.response?.statusCode ?? 0)
               KRProgressHUD.dismiss()
                break
            case .failure( _):
                viewcontroller.view.isUserInteractionEnabled = true
                completionHandler(nil, response.error as NSError?,response.response?.statusCode ?? 0)
               KRProgressHUD.dismiss()
            }
        }
    }else{
        Toast.show(message: "No Internet connection", controller: viewcontroller)
        KRProgressHUD.dismiss()
    }
   
}
}
