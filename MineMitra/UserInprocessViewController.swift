//
//  UserInprocessViewController.swift
//  MineMitra
//
//  Created by Vemulawada Swamy on 28/04/22.
//

import UIKit

class UserInprocessViewController: UIViewController {
    @IBOutlet  var sideMenuView: UIView!
    @IBOutlet  var menuTbl: UITableView!
    @IBOutlet weak var serviceTitle: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var inProcessTable: UITableView!
    @IBOutlet weak var totalCount: UILabel!
    @IBOutlet weak var navigationTitle: UILabel!
    @IBOutlet  var nameLbl: UILabel!
    var serviceTitleStr = ""
    var navigationStr = ""
    var countStr = ""
    var indexArr = ["0","0"]
    var selectedIndexPath:NSIndexPath? = nil
    var isRowExpanded = false
    var isRowExpandedForSecond = false
    var timer = Timer()
    var dynamicHeight = UITableView.automaticDimension
    var underQueryArr = [InProcessData]()
    var pendingArr = [InProcessData]()
    var underQueryCount = 0
    var pendingCount = 0
    var pendingCountArr = [0,0]
    var inTimeItems = [InProcessData]()
    var defaultItems = [InProcessData]()
    var commonArr = [[InProcessData]]()
    var purposeID = ""
    var menuArr = ["Profile","Messaging","Logout"]
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.setRoundedLbl()
        userName.setRounded()
        serviceTitle.text = serviceTitleStr
        navigationTitle.text = navigationStr
        totalCount.text = countStr
        inProcessTable.register(UINib(nibName: "InProcessUnderQueryTableViewCell", bundle: nil), forCellReuseIdentifier: "InProcessUnderQueryTableViewCell")
        inProcessTable.register(UINib(nibName: "InProcessPendingSecondTableViewCell", bundle: nil), forCellReuseIdentifier: "InProcessPendingSecondTableViewCell")
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(reloadTable), userInfo: nil, repeats: false)
        self.inProcessTable.estimatedRowHeight = 100
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTable), name: NSNotification.Name("Height"), object: nil)
        //inProcessTable.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        fetchUnderQueryDataApi()
        sideMenuView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openTable)))
        
    }
    @objc func openTable(){
        if menuTbl.isHidden{
            menuTbl.isHidden = false
        }else{
            menuTbl.isHidden = true
        }
    }
    
    
    func fetchUnderQueryDataApi(){
        DataManager.alamofireGetRequest(url: BASE_URL + "InProcessApplicationCount?customkey=m@b1l3app&purpose=\(purposeID)&status=1&type=query&districtid=0&tehsilid=0&ruletypeid=0", viewcontroller: self, parameters: [:], forInterAction: true) { data, error, code in
            debugPrint("code \(code)")
            if let response = data?.arrayValue{
                for i in response{
                    self.underQueryArr.append(InProcessData(j: i))
                }
            }
        self.underQueryCount = self.underQueryArr.map({$0.TOTAL}).reduce(0, +)
        self.fetchPendingDataApi()
            
            
           
        }
    }
    func fetchPendingDataApi(){
        DataManager.alamofireGetRequest(url: BASE_URL + "InProcessApplicationCount?customkey=m@b1l3app&purpose=\(purposeID)&status=1&type=pending&districtid=0&tehsilid=0&ruletypeid=0", viewcontroller: self, parameters: [:], forInterAction: true) { data, error, code in
            debugPrint("code \(code)")
            if let response = data?.arrayValue{
                for i in response{
                    self.pendingArr.append(InProcessData(j: i))
                }
            }
            self.pendingCount = self.pendingArr.map({$0.TOTAL}).reduce(0, +)
            
            
            self.inTimeItems = self.pendingArr.filter({$0.ApplicationCategory=="InTime"})
            self.pendingCountArr[0] = (( self.inTimeItems.map({$0.TOTAL}).reduce(0, +)))
            self.defaultItems = self.pendingArr.filter({$0.ApplicationCategory=="Default"})
            self.pendingCountArr[1] = (( self.defaultItems.map({$0.TOTAL}).reduce(0, +)))
            self.commonArr.append(self.inTimeItems)
            self.commonArr.append(self.defaultItems)
            DispatchQueue.main.async {
                self.inProcessTable.reloadData()
            }
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if(keyPath == "contentSize"){
            if let newvalue = change?[.newKey]
            {
                let newsize  = newvalue as! CGSize
                //DispatchQueue.main.async {
                   // self.inProcessTable.reloadData()
                //}
                
               //// self.inProcessTable.beginUpdates()
                //self.inProcessTable.endUpdates()
                dynamicHeight = newsize.height
            }
        }
    }
    @objc func reloadTable(){
       // self.inProcessTable.isScrollEnabled = true
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
            self.inProcessTable.beginUpdates()
             self.inProcessTable.endUpdates()
        }
    }
    @objc func reloadMainTable(){
       // self.inProcessTable.isScrollEnabled = true
       // DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.inProcessTable.beginUpdates()
             self.inProcessTable.endUpdates()
       // }
    }
   
    @IBAction func backAction(_ sender: Any) {
        timer.invalidate()
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension UserInprocessViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == menuTbl{
            return 1
        }else{
            return 2
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == menuTbl{
            return menuArr.count
        }else{
        return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == menuTbl{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = menuArr[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }else{
        if indexPath.section == 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: "InProcessUnderQueryTableViewCell", for: indexPath) as! InProcessUnderQueryTableViewCell
            cell.purposeID = purposeID
            cell.navigationStr = navigationStr
            cell.underQueryArr = underQueryArr
            cell.referanceClass = self
            cell.serviceTitleStr = serviceTitleStr
            if !isRowExpanded {
                cell.arrowImage.image = UIImage(named: "down-arrow")
            }else{
                cell.arrowImage.image = UIImage(named: "arrow-up")
            }
            cell.countLbl.text = ":  \(underQueryCount)"
        cell.selectionStyle = .none
        return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "InProcessPendingSecondTableViewCell", for: indexPath) as! InProcessPendingSecondTableViewCell
            cell.purposeID = purposeID
            cell.referanceClass = self
            cell.serviceTitleStr = serviceTitleStr
            cell.pendingCountArr = pendingCountArr
            //cell.inTimeItems = inTimeItems
            cell.navigationStr = navigationStr
            cell.commonArr = commonArr
            if !isRowExpandedForSecond {
                cell.arrowImage.image = UIImage(named: "down-arrow")
                cell.subTable.isHidden = true
            }else{
                cell.arrowImage.image = UIImage(named: "arrow-up")
                cell.subTable.isHidden = false
            }
            cell.countLbl.text = ":  \(pendingCount)"
            cell.subTable.reloadData()
            cell.selectionStyle = .none
            return cell
        }
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
        }else{
        if indexPath.section == 0{
           // isRowExpandedForSecond = false
        if isRowExpanded == false{
            isRowExpanded = true
        }else{
            isRowExpanded = false
        }
            navigationStr = "In Process" + "->" + "Under Query"
        }else{
            //isRowExpanded = false
            if isRowExpandedForSecond == false{
                isRowExpandedForSecond = true
            }else{
                isRowExpandedForSecond = false
            }
            
            navigationStr = "In Process" + "->" + "Pending"

        }
        tableView.reloadRows(at: [indexPath], with: .none)
        tableView.beginUpdates()
        tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == menuTbl{
            return 35
        }else{
        if indexPath.section == 0{
        return isRowExpanded ? UITableView.automaticDimension : 65
        }else{
        return isRowExpandedForSecond ? UITableView.automaticDimension  : 65
        }
        }
    }
   
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //inProcessTable.alwaysBounceVertical = true;
        debugPrint("scrollViewDidScroll")
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        debugPrint("scrollViewDidEndDecelerating")
    }
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        debugPrint("scrollViewShouldScrollToTop")
        return false
       
    }
}
