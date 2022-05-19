//
//  SearchViewController.swift
//  MineMitra
//
//  Created by Swamy on 02/05/22.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet  var sideMenuView: UIView!
    @IBOutlet  var menuTbl: UITableView!
    @IBOutlet weak var applicationStatus: UILabel!
    @IBOutlet var searchTF:UITextField!
    @IBOutlet var resultTbl:UITableView!
    @IBOutlet var searchIcon:UIView!
    @IBOutlet weak var nameLbl: UILabel!
    var searchData = [SearchData]()
    var titleArr = ["Application Number","Application Name","Type Of Application","Date of Application","Pending At"]
    var menuArr = ["Profile","Messaging","Logout"]
    var resultsArr = [String]()
    let details = UserDetails.loadData()
    var fromHome = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.setRoundedLbl()
        if fromHome == true{
            getDetails()
        }
        searchIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchApplicationCall)))
        sideMenuView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openTable)))
        
    }
    @objc func openTable(){
        if menuTbl.isHidden{
            menuTbl.isHidden = false
        }else{
            menuTbl.isHidden = true
        }
    }
    @objc func searchApplicationCall(){
        self.view.endEditing(true)
        if searchTF.text == ""{
            Toast.show(message: "Please enter application number", controller: self)
            return
        }
        searchCall(text: searchTF.text!)
    }
    
    
    @IBAction func backAction(_ sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    func getDetails(){
        if self.searchData.count > 0{
            self.resultsArr.append( self.searchData[0].ApplicationNumber)
            self.resultsArr.append( self.searchData[0].ApplicantName)
            self.resultsArr.append( self.searchData[0].TypeOfApplication)
            self.resultsArr.append( self.searchData[0].ApplicationDate)
            self.resultsArr.append( self.searchData[0].ApplicationEnd)
            self.applicationStatus.text = self.searchData[0].ApplicationStatus
        }
        DispatchQueue.main.async {
            self.resultTbl.reloadData()
        }
    }
    
    func searchCall(text: String){
        
        DataManager.alamofireGetRequest(url: BASE_URL + "MAApplicationSearch?customkey=m@b1l3app&applicationnumber=\(text)&roll=Director&loginuserid=\(details!.UserId)", viewcontroller: self, parameters: [:], forInterAction: true) { data, error, code in
         
            if let response = data?.arrayValue{
                for i in response{
                    self.searchData.append(SearchData(j: i))
                }
                self.getDetails()
                
            }else{
                self.resultsArr.removeAll()
                DispatchQueue.main.async {
                    self.resultTbl.reloadData()
                }
            }
        }
    }
    

}
extension SearchViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == menuTbl{
            return menuArr.count
        }else{
        if resultsArr.count == 0{
            return 0
        }
        return titleArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == menuTbl{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.selectionStyle = .none
            cell.textLabel?.text = menuArr[indexPath.row]
            return cell
        }else{
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultsCell", for: indexPath) as! SearchResultsCell
        cell.titleName.text = titleArr[indexPath.row]
        cell.resultLbl.text = resultsArr[indexPath.row]
        return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == menuTbl{
            return 35
        }else{
            return UITableView.automaticDimension
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
class SearchResultsCell:UITableViewCell{
    @IBOutlet var titleName:UILabel!
    @IBOutlet var resultLbl:UILabel!
}
