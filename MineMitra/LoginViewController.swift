//
//  LoginViewController.swift
//  MineMitra
//
//  Created by Vemulawada Swamy on 29/04/22.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    @IBOutlet weak var loginTable: UITableView!
    @IBOutlet var userNameTF:UITextField!
    @IBOutlet var passwordTF:UITextField!
    var roleType = ""
    var loginModel:LoginData?
    override func viewDidLoad() {
        super.viewDidLoad()
        Utility.textFieldPadding(TF: userNameTF)
        Utility.textFieldPadding(TF: passwordTF)
        let bgImg = UIImageView()
        bgImg.image = UIImage(named: "main_ng_start")
        bgImg.contentMode = .scaleAspectFill
        loginTable.backgroundView = bgImg
    }
   
    @IBAction func loginAction(_ sender:UIButton){
        self.view.endEditing(true)
        if userNameTF.text?.count == 0{
            Toast.show(message: "Please enter Username", controller: self)
            return
        }
        if passwordTF.text?.count == 0{
            Toast.show(message: "Please enter Password", controller: self)
            return
        }
        loginApi()
    }
    @IBAction func backAction(_ sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension LoginViewController{
    // MARK: Api implementation
    func loginApi(){
        DataManager.alamofireGetRequest(url: BASE_URL + LOGIN_URL + "username=\(userNameTF.text!)&password=\(passwordTF.text!)" , viewcontroller: self, parameters: [:], forInterAction: true) { data, error, code in
            self.loginModel = LoginData(j: data!)
            UserDetails.saveData(people: self.loginModel)
            if self.loginModel?.Status == "Failure"{
                Toast.show(message: self.loginModel?.Message ?? "", controller: self)
            }else{
                UserDefaults.standard.set(true, forKey: "isLogin")
                Utility.goToViewController(controllerID: "GetStartedViewController", viewController: self)
            }
        }
    }
}
