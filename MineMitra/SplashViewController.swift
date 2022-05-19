//
//  SplashViewController.swift
//  MineMitra
//
//  Created by Vemulawada Swamy on 29/04/22.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            if UserDefaults.standard.bool(forKey: "isLogin"){
                Utility.goToViewController(controllerID: "DashboardViewController", viewController: self)
            }else{
                Utility.goToViewController(controllerID: "SelectRoleViewController", viewController: self)
            }
            
        }
    }
    


}
