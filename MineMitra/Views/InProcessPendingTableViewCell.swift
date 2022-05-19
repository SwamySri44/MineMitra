//
//  InProcessPendingTableViewCell.swift
//  MineMitra
//
//  Created by Vemulawada Swamy on 28/04/22.
//

import UIKit

class InProcessPendingTableViewCell: UITableViewCell {
    @IBOutlet var subTable:UITableView!
    @IBOutlet var tableHeight:NSLayoutConstraint!
    @IBOutlet var inProcessStatus:UILabel!
    @IBOutlet var countLbl:UILabel!
    @IBOutlet var arrowImage:UIImageView!
    var forPending = false
    var referanceClass:UserInprocessViewController?
    var navigationStr = ""
    var commonArr1 = [InProcessData]()
    var commonArr = [InProcessData]()
    var commonArr2 = [InProcessData]()
    var tagIndex = 0
    var purposeID = ""
    var serviceTitleStr = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        subTable.delegate = self
        subTable.dataSource = self
        subTable.register(UINib(nibName: "InProcessCommonTableViewCell", bundle: nil), forCellReuseIdentifier: "InProcessCommonTableViewCell")
        subTable.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if(keyPath == "contentSize"){
            if let newvalue = change?[.newKey]
            {
                let newsize  = newvalue as! CGSize
                tableHeight.constant = newsize.height
            }
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension InProcessPendingTableViewCell:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if commonArr.count == 0{
            return 0
        }
        return commonArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InProcessCommonTableViewCell", for: indexPath) as!
            InProcessCommonTableViewCell
            cell.titleNameLbl.text = commonArr[indexPath.row].ApplicationEnd
            cell.countLbl.text = ":   \(commonArr[indexPath.row].TOTAL)"

        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objVC = self.referanceClass?.storyboard?.instantiateViewController(withIdentifier: "UserApplicationStatusListViewController") as! UserApplicationStatusListViewController
            objVC.navigationStr =  navigationStr  + "->" + commonArr[indexPath.row].ApplicationEnd
        objVC.subCat = commonArr[indexPath.row].ApplicationCategory
        objVC.roll = commonArr[indexPath.row].ApplicationEnd
        objVC.category = "pending"
        objVC.purposeId = purposeID
        objVC.serviceTitleStr = serviceTitleStr
        self.referanceClass?.navigationController?.pushViewController(objVC, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
