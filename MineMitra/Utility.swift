//
//  Utility.swift
//  NINDY KAUR
//
//  Created by Radiant Web Tech on 28/01/20.
//  Copyright © 2020 Radiant Web Tech. All rights reserved.
//

import UIKit
import Network
import SystemConfiguration
import AVFoundation
class Utility: NSObject {
    
      class func setPlaceHolderColor(TxtField:UITextField,name:String){
              TxtField.attributedPlaceholder = NSAttributedString(string: name,
               attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)])
            
           }
    class func setPlaceHolderColor1(TxtField:UITextField,name:String){
       TxtField.attributedPlaceholder = NSAttributedString(string: name,
        attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
     
    }
    class func trimWhiteSpaces(name:String) -> String{
        let trimmed =  name.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed
               
    }
    
    class func monitorInternet(){
        if #available(iOS 12.0, *) {
            let monitor = NWPathMonitor()
            monitor.pathUpdateHandler = { path in
                if path.status == .satisfied {
                    print("We're connected!")
                } else {
                    print("No connection.")
                }

                print(path.isExpensive)
            }
            let queue = DispatchQueue(label: "Monitor")
            monitor.start(queue: queue)
        } else {
            
        }
       
    }
    class func appendString(data: Double) -> String { // changed input type of data
        let value = data
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2 // for float
        formatter.maximumFractionDigits = 2 // for float
        formatter.minimumIntegerDigits = 1
        formatter.paddingPosition = .afterPrefix
        formatter.paddingCharacter = "0"
        return formatter.string(from: NSNumber(floatLiteral: value))! // here double() is not required as data is already double
    }
    
    
        class func textFieldPadding(TF:UITextField){
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: TF.frame.height))
            //let paddingView = UIView(frame: CGRect()
            TF.leftView = paddingView
            TF.leftViewMode = UITextField.ViewMode.always
        }
        class func isInternetAvailable() -> Bool {
              var zeroAddress = sockaddr_in()
              zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
              zeroAddress.sin_family = sa_family_t(AF_INET)
              
              let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
                  $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                      SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
                  }
              }
              var flags = SCNetworkReachabilityFlags()
              if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
                  return false
              }
              let isReachable = flags.contains(.reachable)
              let needsConnection = flags.contains(.connectionRequired)
              return (isReachable)
          }
          class func isValidEmail(testStr:String) -> Bool {
              let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
              
              let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
              return emailTest.evaluate(with: testStr)
          }
    
    class func isValidNumber(testStr:String) -> Bool {
        let mobileNumberReg = "[0-9]{10}"
        
        let numberTest = NSPredicate(format:"SELF MATCHES %@", mobileNumberReg)
        return numberTest.evaluate(with: testStr)
    }
          class func goToViewController(controllerID:String, viewController:UIViewController) {
              let objVC = viewController.storyboard?.instantiateViewController(withIdentifier: controllerID)
              viewController.navigationController?.pushViewController(objVC!, animated: true)
          }
          class func showAlertMessage(title: String, message: String, view: UIViewController) {
              let objAlert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
              //Create and an option action
              let nextAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { action -> Void in
                  //Do some other stuff
              }
              objAlert.addAction(nextAction)
              view.present(objAlert, animated: true, completion: nil)
          }
          
          class func showksAlertMessageWithOkAndCancelAction(title: String, message: String, view: UIViewController, completion: @escaping () -> Void,completion1: @escaping () -> Void) {
              let objAlert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
              //Create and an option action
              let nextAction: UIAlertAction = UIAlertAction(title: "Update", style: .default) { action -> Void in
                  completion()
              }
              let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .default) { action -> Void in
                completion1()
              }
              objAlert.addAction(nextAction)
              objAlert.addAction(cancelAction)
              view.present(objAlert, animated: true, completion: nil)
          }
          class func showksAlertMessageWithOkAction(title: String, message: String, view: UIViewController, completion: @escaping () -> Void) {
                 let objAlert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                 //Create and an option action
                 let nextAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { action -> Void in
                     completion()
                 }
                 
                 objAlert.addAction(nextAction)
                 
                 view.present(objAlert, animated: true, completion: nil)
             }
         
        class  func applyPlaceholderStyle(aTextview: UITextView, placeholderText: String)
          {
              
              aTextview.textColor = UIColor.lightGray
              aTextview.text = placeholderText
          }
         
          
         class func applyNonPlaceholderStyle(aTextview: UITextView)
          {
              aTextview.textColor = UIColor.darkText
              aTextview.text = ""
              aTextview.alpha = 1.0
          }
    
   class func convertUTCToLocal(timeString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"

        dateFormatter.timeZone = TimeZone.init(abbreviation: "UTC")
        let timeUTC = dateFormatter.date(from: timeString)

        if timeUTC != nil {
            dateFormatter.timeZone = NSTimeZone.local

            let localTime = dateFormatter.string(from: timeUTC!)
            return localTime
        }

        return nil
    }
    
    
    
    enum GradiantDirection {
            case leftToRight
            case rightToLeft
            case topToBottom
            case bottomToTop
        }
        
     class  func setGradiantColor(view : UIView, topColor : UIColor, bottomColor:UIColor, cornerRadius : CGFloat = 0.0,gradiantDirection : GradiantDirection = .topToBottom )
        {
            
            view.layer.sublayers?.filter{ $0 is CAGradientLayer }.forEach{ $0.removeFromSuperlayer() }
            
            let gradient: CAGradientLayer = CAGradientLayer()
            gradient.colors = [topColor.cgColor,bottomColor.cgColor]
            gradient.frame = view.bounds
            
            switch gradiantDirection {
            case .topToBottom:
                gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
                gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
            case .bottomToTop:
                gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
                gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
            case .leftToRight:
                gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
                gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
            case .rightToLeft:
                gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
                gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
            }
                   
                   gradient.masksToBounds = true
                   let gradientLayer = CAGradientLayer()
                   gradientLayer.cornerRadius = cornerRadius
                   gradient.rasterizationScale = 100
                   view.layer.insertSublayer(gradient, at: 0)
               }
    
    
  class  func notPrettyString(from object: Any) -> String? {
        if let objectData = try? JSONSerialization.data(withJSONObject: object, options: JSONSerialization.WritingOptions(rawValue: 0)) {
            let objectString = String(data: objectData, encoding: .utf8)
            return objectString
        }
        return nil
    }
    class func stringify(json: Any, prettyPrinted: Bool = false) -> String {
        var options: JSONSerialization.WritingOptions = []
        if prettyPrinted {
          options = JSONSerialization.WritingOptions.prettyPrinted
        }

        do {
          let data = try JSONSerialization.data(withJSONObject: json, options: options)
          if let string = String(data: data, encoding: String.Encoding.utf8) {
            return string
          }
        } catch {
          print(error)
        }

        return ""
    }
    
    class func convertHtmlToString(text:String?,font:String,size:CGFloat)->NSAttributedString{
        let tempAttr = NSAttributedString()
        let options: [NSAttributedString.DocumentReadingOptionKey : Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        let html = text
        guard let data = html?.data(using: .utf8)! else { return tempAttr}
        let att = try! NSAttributedString.init(
            data: data, options: options,
            documentAttributes: nil)
        let matt = NSMutableAttributedString(attributedString:att)
       
       
        matt.enumerateAttribute(
            NSAttributedString.Key.font,
            in:NSMakeRange(0,matt.length),
            options:.longestEffectiveRangeNotRequired) { value, range, stop in
                let f1 = value as! UIFont
                let f2 = UIFont(name:font, size:size)!
                if let f3 = applyTraitsFromFont(f1, to:f2) {
                    matt.addAttribute(
                        NSAttributedString.Key.font, value:f3, range:range)
                    
                    
                    
                    if UserDefaults.standard.bool(forKey: "Dark") == false{
                        matt.addAttributes([NSAttributedString.Key.foregroundColor :#colorLiteral(red: 0.2666666667, green: 0.2666666667, blue: 0.2666666667, alpha: 1)], range: range)
                            }else if  UserDefaults.standard.bool(forKey: "Dark") == true{
                                matt.addAttributes([NSAttributedString.Key.foregroundColor :UIColor.white], range: range)
                            }else{
                            matt.addAttributes([NSAttributedString.Key.foregroundColor :#colorLiteral(red: 0.2666666667, green: 0.2666666667, blue: 0.2666666667, alpha: 1)], range: range)
                            }
                    
                   
                }
            }
        return matt
    }
class    func applyTraitsFromFont(_ f1: UIFont, to f2: UIFont) -> UIFont? {
        let t = f1.fontDescriptor.symbolicTraits
        if let fd = f2.fontDescriptor.withSymbolicTraits(t) {
            return UIFont.init(descriptor: fd, size: 0)
        }
        return nil
    }
    
   
    
    
    class func changeParticularFont(txt:String,longStr:String)-> NSAttributedString{
        let longString = longStr
        let longestWord = txt

        let longestWordRange = (longString as NSString).range(of: longestWord)

        let attributedString = NSMutableAttributedString(string: longString, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)])

        attributedString.setAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.black], range: longestWordRange)


        return attributedString
    }
    
    class func FontApply(field:UITextField?,label:UILabel?,fontStyle:String,type:String){
        if type == "small"{
        if fontStyle == "Regular"{
            field?.font  = UIFont(name: "Inter-Regular", size: 12)
            label?.font  = UIFont(name: "Inter-Regular", size: 12)
            
           
            
        }else if fontStyle == "Medium"{
            field?.font  = UIFont(name: "Inter-Medium", size: 12)
            label?.font  = UIFont(name: "Inter-Medium", size: 12)
          
        }else if fontStyle == "Bold" {
            field?.font  = UIFont(name: "Inter-Bold", size: 12)
            label?.font  = UIFont(name: "Inter-Bold", size: 12)
           
        }else if fontStyle == "Semi" {
            field?.font  = UIFont(name: "Inter-SemiBold", size: 12)
            label?.font  = UIFont(name: "Inter-SemiBold", size: 12)
           
        }else{
            field?.font  = UIFont(name: "Inter-SemiBold", size: 12)
            label?.font  = UIFont(name: "Inter-SemiBold", size: 12)
        }
        }else if type == "medium"{
            if fontStyle == "Regular"{
                field?.font  = UIFont(name: "Inter-Regular", size: 16)
                label?.font  = UIFont(name: "Inter-Regular", size: 16)
               
               
                
            }else if fontStyle == "Medium"{
                field?.font  = UIFont(name: "Inter-Medium", size: 16)
                label?.font  = UIFont(name: "Inter-Medium", size: 16)
                
            }else if fontStyle == "Bold" {
                field?.font  = UIFont(name: "Inter-Bold", size: 16)
                label?.font  = UIFont(name: "Inter-Bold", size: 16)
               
            }else if fontStyle == "Semi" {
                field?.font  = UIFont(name: "Inter-SemiBold", size: 16)
                label?.font  = UIFont(name: "Inter-SemiBold", size: 16)
               
            }else{
                field?.font  = UIFont(name: "Inter-ExtraBold", size: 16)
                label?.font  = UIFont(name: "Inter-ExtraBold", size: 16)
            }
        }else if type == "large"{
            if fontStyle == "Regular"{
                field?.font  = UIFont(name: "Inter-Regular", size: 20)
                label?.font  = UIFont(name: "Inter-Regular", size: 20)
                
               
                
            }else if fontStyle == "Medium"{
                field?.font  = UIFont(name: "Inter-Medium", size: 20)
                label?.font  = UIFont(name: "Inter-Medium", size: 20)
                
            }else if fontStyle == "Bold" {
                field?.font  = UIFont(name: "Inter-Bold", size: 20)
                label?.font  = UIFont(name: "Inter-Bold", size: 20)
               
            }else if fontStyle == "Semi" {
                field?.font  = UIFont(name: "Inter-SemiBold", size: 20)
                label?.font  = UIFont(name: "Inter-SemiBold", size: 20)
               
            }else{
                field?.font  = UIFont(name: "Inter-ExtraBold", size: 20)
                label?.font  = UIFont(name: "Inter-ExtraBold", size: 20)
            }
        }
        
    }



  
}
 // 1. Importing the Library

