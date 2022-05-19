//
//  InProcessUnderQueryTableViewCell.swift
//  MineMitra
//
//  Created by Vemulawada Swamy on 28/04/22.
//

import UIKit

class InProcessUnderQueryTableViewCell: UITableViewCell {
    @IBOutlet var subTable:UITableView!
    @IBOutlet var tableHeight:NSLayoutConstraint!
    @IBOutlet var inProcessStatus:UILabel!
    @IBOutlet var countLbl:UILabel!
    @IBOutlet var arrowImage:UIImageView!
    var underQueryArr = [InProcessData]()
    var referanceClass:UserInprocessViewController?
    var navigationStr = ""
    var purposeID = ""
    var serviceTitleStr = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        subTable.delegate = self
        subTable.dataSource = self
        subTable.register(UINib(nibName: "InProcessPendingTableViewCell", bundle: nil), forCellReuseIdentifier: "InProcessPendingTableViewCell")
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
extension InProcessUnderQueryTableViewCell:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return underQueryArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            let cell = tableView.dequeueReusableCell(withIdentifier: "InProcessCommonTableViewCell", for: indexPath) as!
            InProcessCommonTableViewCell
        cell.titleNameLbl.text = underQueryArr[indexPath.row].ApplicationEnd
        cell.countLbl.text = "\(underQueryArr[indexPath.row].TOTAL)"
        cell.selectionStyle = .none
            return cell
        
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objVC = self.referanceClass?.storyboard?.instantiateViewController(withIdentifier: "UserApplicationStatusListViewController") as! UserApplicationStatusListViewController
        objVC.serviceTitleStr = serviceTitleStr
        objVC.navigationStr = navigationStr + "->" + underQueryArr[indexPath.row].ApplicationEnd
        objVC.roll  = underQueryArr[indexPath.row].ApplicationEnd
        objVC.category = "query"
        objVC.purposeId = purposeID
        self.referanceClass?.navigationController?.pushViewController(objVC, animated: true)
    }
    
    
}
