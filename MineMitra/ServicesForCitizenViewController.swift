//
//  ServicesForCitizenViewController.swift
//  MineMitra
//
//  Created by Vemulawada Swamy on 28/04/22.
//

import UIKit

class ServicesForCitizenViewController: UIViewController {
    
    @IBOutlet weak var sideMenuView: UIView!
    @IBOutlet weak var menuTbl: UITableView!
    @IBOutlet  var nameLbl: UILabel!
    @IBOutlet  var searchImg: UIView!
    @IBOutlet var searchTF:UITextField!
    var dataArr = [DashboardData]()
    var valuesArr = [[String]]()
    var searchData = [SearchData]()
    let details = UserDetails.loadData()
    var menuArr = ["Profile","Messaging","Logout"]
        @IBOutlet var nameTbl:UITableView!
        override func viewDidLoad() {
            super.viewDidLoad()
            nameLbl.setRoundedLbl()
            callCitizenServices()
            searchImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchApplicationCall)))
            sideMenuView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openTable)))
            
        }
        @objc func openTable(){
            if menuTbl.isHidden{
                menuTbl.isHidden = false
            }else{
                menuTbl.isHidden = true
            }
        }

    //MARK: Api implemention
        func callCitizenServices(){
            DataManager.alamofireGetRequest(url:  BASE_URL + DASHBOARD_URL + "districtid=0&tehsilid=0", viewcontroller: self, parameters: [:], forInterAction: true) { data, error, code in
                if code == 200{
                    if data?.count ?? 0 > 0{
                        for i in data!.arrayValue{
                            self.dataArr.append(DashboardData(j: i))
                        }
                        
                        for j in self.dataArr{
                            var localArr = [String]()
                            localArr.append(j.RECEIVED)
                            localArr.append(j.APPROVED)
                            localArr.append(j.INPROCESS)
                            localArr.append(j.REJECTED)
                            self.valuesArr.append(localArr)
                        }
                        DispatchQueue.main.async {
                            self.nameTbl.reloadData()
                        }
                        //debugPrint("total array \(self.valuesArr)")
                        //dump(self.dataArr)
                    }
                }else{
                    debugPrint("Something went wrong")
                }
            }
            
        }
    
    func searchCall(text: String){
        DataManager.alamofireGetRequest(url: BASE_URL + "MAApplicationSearch?customkey=m@b1l3app&applicationnumber=\(text)&roll=Director&loginuserid=\(details!.UserId)", viewcontroller: self, parameters: [:], forInterAction: true) { data, error, code in
            
            if data?.arrayValue.count ?? 0 == 0{
                Toast.show(message: "No Application found", controller: self)
                return
            }
            if let response = data?.arrayValue{
                for i in response{
                    self.searchData.append(SearchData(j: i))
                }
                let objVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
                objVC.fromHome = true
                objVC.searchData = self.searchData
                self.navigationController?.pushViewController(objVC, animated: true)

            }else{
                Toast.show(message: "No Application found", controller: self)
            }
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
    
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

    extension ServicesForCitizenViewController:UITableViewDelegate,UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if tableView == menuTbl{
                return menuArr.count
            }else{
            return dataArr.count
            }
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if tableView == menuTbl{
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.textLabel?.text = menuArr[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as! NameCell
            cell.refreanceClass = self
            cell.nameLbl.text = dataArr[indexPath.row].PurposeType
            cell.recivedCountLbl.text = dataArr[indexPath.row].RECEIVED
            cell.approvedCountLbl.text = dataArr[indexPath.row].APPROVED
            cell.inProcessCountLbl.text = dataArr[indexPath.row].INPROCESS
            cell.rejectedCountLbl.text = dataArr[indexPath.row].REJECTED
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
            }
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if tableView == menuTbl{
                return 35
            }else{
            return 210
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
extension ServicesForCitizenViewController:DashBoard{
    func recieveAction(cell: NameCell) {
        if let index = nameTbl.indexPath(for: cell){
            let objVC = self.storyboard?.instantiateViewController(withIdentifier: "UserApplicationStatusListViewController") as! UserApplicationStatusListViewController
            objVC.navigationStr = "Recieved"
            objVC.serviceTitleStr = dataArr[index.row].PurposeType
            objVC.countStr = dataArr[index.row].RECEIVED
            objVC.purposeId = dataArr[index.row].PurposeId
            objVC.status = "1"
            objVC.exceptInProcess = false
            self.navigationController?.pushViewController(objVC, animated: true)
        }
    }
    
    func approvedAction(cell: NameCell) {
        if let index = nameTbl.indexPath(for: cell){
            let objVC = self.storyboard?.instantiateViewController(withIdentifier: "UserApplicationStatusListViewController") as! UserApplicationStatusListViewController
            objVC.navigationStr = "Approved"
            objVC.purposeId = dataArr[index.row].PurposeId
            objVC.status = "2"
            objVC.serviceTitleStr = dataArr[index.row].PurposeType
            objVC.exceptInProcess = false
            objVC.countStr = dataArr[index.row].APPROVED
            self.navigationController?.pushViewController(objVC, animated: true)
        }
    }
    
    func inProcessAction(cell: NameCell) {
        if let index = nameTbl.indexPath(for: cell){
            let objVC = self.storyboard?.instantiateViewController(withIdentifier: "UserInprocessViewController") as! UserInprocessViewController
            objVC.serviceTitleStr = dataArr[index.row].PurposeType
            objVC.purposeID = dataArr[index.row].PurposeId
            objVC.serviceTitleStr = dataArr[index.row].PurposeType
            objVC.navigationStr = "In Process"
            //objVC.exceptInProcess = false
            objVC.countStr = "Total :  " + (dataArr[index.row].INPROCESS)
            self.navigationController?.pushViewController(objVC, animated: true)
        }
    }
    
    func rejectedAction(cell: NameCell) {
        if let index = nameTbl.indexPath(for: cell){
            let objVC = self.storyboard?.instantiateViewController(withIdentifier: "UserApplicationStatusListViewController") as! UserApplicationStatusListViewController
            objVC.navigationStr = "Rejected"
            objVC.serviceTitleStr = dataArr[index.row].PurposeType
            objVC.purposeId = dataArr[index.row].PurposeId
            objVC.status = "3"
            objVC.exceptInProcess = false
            objVC.countStr = dataArr[index.row].REJECTED
            self.navigationController?.pushViewController(objVC, animated: true)
        }
    }
    
    
}


    class NameCell:UITableViewCell{
       // @IBOutlet weak var statusCollection: UICollectionView!
        @IBOutlet var recivedCountLbl:UILabel!
        @IBOutlet var approvedCountLbl:UILabel!
        @IBOutlet var inProcessCountLbl:UILabel!
        @IBOutlet var rejectedCountLbl:UILabel!
        @IBOutlet var nameLbl:UILabel!
        var dataList :  DashboardData!
        var delegate:DashBoard?
        var titleArr = ["Recieved","Approved","In Process","Rejected"]
        var refreanceClass:ServicesForCitizenViewController?
        var valuesArr = [String]()
        override func awakeFromNib() {
        }
        
        @IBAction func recievedAction(_ sender:UIButton){
            delegate?.recieveAction(cell: self)
        }
        @IBAction func approvedAction(_ sender:UIButton){
            delegate?.approvedAction(cell: self)
        }
        @IBAction func inProcessAction(_ sender:UIButton){
            delegate?.inProcessAction(cell: self)
        }
        @IBAction func rejectedAction(_ sender:UIButton){
            delegate?.rejectedAction(cell: self)
        }
        
        
        
//        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return titleArr.count
//        }
//        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatusCell", for: indexPath) as! StatusCell
//            dump(dataList)
//            cell.statusLbl.text = titleArr[indexPath.row]
//            cell.countLbl.text = valuesArr[indexPath.row]
//            if titleArr[indexPath.row] == "Recieved"{
//
//                cell.bgView.backgroundColor = UIColor.hexStringToUIColor(hex: "#9DF6B3")
//            }else if titleArr[indexPath.row] == "Approved"{
//                //cell.countLbl.text = valuesArr[1]
//                cell.bgView.backgroundColor = UIColor.hexStringToUIColor(hex: "#FFD79B")
//            }else if titleArr[indexPath.row] == "Rejected"{
//               // cell.countLbl.text = valuesArr[3]
//                cell.bgView.backgroundColor = UIColor.hexStringToUIColor(hex: "#FFAE90")
//            }else if titleArr[indexPath.row] == "In Process"{
//                //cell.countLbl.text = valuesArr[2]
//                cell.bgView.backgroundColor = UIColor.hexStringToUIColor(hex: "#7CF4F5")
//            }
//            return cell
//        }
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            return CGSize(width: collectionView.bounds.width/2 - 10, height: 60)
//        }
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//            return 10
//        }
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//            return 10
//        }
//        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            if titleArr[indexPath.row] == "Recieved" || titleArr[indexPath.row] == "Approved" || titleArr[indexPath.row] == "Rejected" {
//                let objVC = refreanceClass?.storyboard?.instantiateViewController(withIdentifier: "UserApplicationStatusListViewController") as! UserApplicationStatusListViewController
//                objVC.serviceTitleStr = dataList.PurposeType ?? ""
//                if titleArr[indexPath.row] == "Recieved" {
//                    objVC.navigationStr = "Recieved"
//                    objVC.countStr = dataList.RECEIVED ?? "0"
//                }else if titleArr[indexPath.row] == "Approved" {
//                    objVC.navigationStr = "Approved"
//                    objVC.countStr = dataList.APPROVED ?? "0"
//                }else if titleArr[indexPath.row] == "Rejected" {
//                    objVC.navigationStr = "Rejected"
//                    objVC.countStr = dataList.REJECTED ?? "0"
//                }
//
//                refreanceClass?.navigationController?.pushViewController(objVC, animated: true)
//            }else if titleArr[indexPath.row] == "In Process"{
//                let objVC = refreanceClass?.storyboard?.instantiateViewController(withIdentifier: "UserInprocessViewController") as! UserInprocessViewController
//                objVC.purposeID = dataList.PurposeId ?? ""
//                objVC.serviceTitleStr = dataList.PurposeType ?? ""
//                objVC.navigationStr = "In Process"
//                objVC.countStr = "Total :  " + (dataList.INPROCESS ?? "0")
//                refreanceClass?.navigationController?.pushViewController(objVC, animated: true)
//            }
//
//
//        }
    }
    class StatusCell:UICollectionViewCell{
        @IBOutlet var statusLbl:UILabel!
        @IBOutlet var countLbl:UILabel!
        @IBOutlet var bgView:UIView!
        override  func awakeFromNib() {
            
        }
    }

protocol DashBoard{
    func recieveAction(cell:NameCell)
    func approvedAction(cell:NameCell)
    func inProcessAction(cell:NameCell)
    func rejectedAction(cell:NameCell)
}
