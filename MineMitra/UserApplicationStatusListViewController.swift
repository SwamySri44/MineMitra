//
//  UserApplicationStatusListViewController.swift
//  MineMitra
//
//  Created by Vemulawada Swamy on 28/04/22.
//

import UIKit

class UserApplicationStatusListViewController: UIViewController {
    
    @IBOutlet  var sideMenuView: UIView!
    @IBOutlet  var menuTbl: UITableView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var totalCount: UILabel!
    @IBOutlet weak var listTable: UITableView!
    @IBOutlet weak var navigationTitle: UILabel!
    @IBOutlet weak var serviceTitle: UILabel!
  
    var serviceTitleStr = ""
    var navigationStr = ""
    var countStr = ""
    var roll = ""
    var category = ""
    var subCat = ""
    var userDetails = UserDetails.loadData()!
    var applicationDataArr = [ApplicationData]()
    var exceptInProcess = true
    var purposeId = ""
    var status = ""
    var menuArr = ["Profile","Messaging","Logout"]
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.setRoundedLbl()
        serviceTitle.text = serviceTitleStr
        navigationTitle.text = navigationStr
        totalCount.text = countStr
        listTable.register(UINib(nibName: "UsersListTableViewCell", bundle: nil), forCellReuseIdentifier: "UsersListTableViewCell")
        sideMenuView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openTable)))
        
    }
    @objc func openTable(){
        if menuTbl.isHidden{
            menuTbl.isHidden = false
        }else{
            menuTbl.isHidden = true
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if exceptInProcess {
            roll = roll.replacingOccurrences(of: " ", with: "%20")
        getRollTypeApplicationAPi(subUrl: BASE_URL + "InProcessDistrictWiseCount?customkey=m@b1l3app&purpose=\(purposeId)&status=4&districtid=0&tehsilid=0&category=" + "\(category)&validity=\(subCat)&roll=\(roll)&loginuserid=\(userDetails.UserId)&ruletypeid=0")
        }else{
            getRollTypeApplicationAPi(subUrl: BASE_URL + "DistrictWiseCount?customkey=m@b1l3app&purpose=\(purposeId)&status=\(status)&districtid=0&tehsilid=0&ruletypeid=0")
        }
    }
   
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func getRollTypeApplicationAPi(subUrl:String){
        DataManager.alamofireGetRequest(url: subUrl, viewcontroller: self, parameters: [:], forInterAction: true) { data, error, code in
            if let response = data?.arrayValue{
                for i in response{
                    self.applicationDataArr.append(ApplicationData(j: i))
                }
            }
            if self.exceptInProcess == true{
                self.applicationDataArr = self.applicationDataArr.sorted(by: {$0.TOTAL > $1.TOTAL})
            }
           
            
            DispatchQueue.main.async {
                self.listTable.reloadData()
                self.totalCount.text = "\(( self.applicationDataArr.map({$0.TOTAL}).reduce(0, +)))"
            }
            
        }
    }
    

}
extension UserApplicationStatusListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == menuTbl{
        return menuArr.count
        }else{
        return applicationDataArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == menuTbl{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = menuArr[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }else{
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersListTableViewCell", for: indexPath) as! UsersListTableViewCell
        cell.countLabel.text = "\(applicationDataArr[indexPath.row].TOTAL)"
        cell.districtname.text = applicationDataArr[indexPath.row].DistrictName
        cell.serialNumber.text = "\(indexPath.row+1)"
        cell.selectionStyle = .none
        return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == menuTbl{
        if indexPath.row == 0{
            Utility.goToViewController(controllerID: "UserProfileViewController", viewController: self)
        }else if indexPath.row == 1{
            Toast.show(message: "Comming Soon", controller: self)
        }else{
            UserDefaults.standard.removeObject(forKey: "isLogin")
            Utility.goToViewController(controllerID: "SelectRoleViewController", viewController: self)
        }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == menuTbl{
            return 35
        }else{
            return UITableView.automaticDimension
        }
    }
    
    
}
