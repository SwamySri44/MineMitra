//
//  GetStartedViewController.swift
//  MineMitra
//
//  Created by Swamy on 30/04/22.
//

import UIKit

class GetStartedViewController: UIViewController {
    var fromLogin = false
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func startedAction(_ sender:UIButton){
        if fromLogin == true{
            Utility.goToViewController(controllerID: "DashboardViewController", viewController: self)
        }else{
            self.removeFromParent()
            self.view.removeFromSuperview()
        }
       
    }
 

}
