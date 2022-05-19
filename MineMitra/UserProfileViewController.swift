//
//  UserProfileViewController.swift
//  MineMitra
//
//  Created by Swamy on 01/05/22.
//

import UIKit

class UserProfileViewController: UIViewController {
    @IBOutlet var mobileNumber:UILabel!
    @IBOutlet var emailLbl:UILabel!
    
    @IBOutlet weak var versionLbl: UILabel!
    
    let details = UserDetails.loadData()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userData = details{
            mobileNumber.text = "Mobile No. :       " + userData.MobileNo
            emailLbl.text = "Email ID :       " + userData.EmailId
        }
    }
    

    
    // MARK: - IBActions

    @IBAction func backAction(_ sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func logoutAction(_ sender:UIButton){
        UserDefaults.standard.removeObject(forKey: "isLogin")
        Utility.goToViewController(controllerID: "SelectRoleViewController", viewController: self)
    }

}
