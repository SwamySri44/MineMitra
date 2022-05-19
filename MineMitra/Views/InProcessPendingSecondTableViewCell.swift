//
//  InProcessPendingSecondTableViewCell.swift
//  MineMitra
//
//  Created by Vemulawada Swamy on 28/04/22.
//

import UIKit

class InProcessPendingSecondTableViewCell: UITableViewCell {

    @IBOutlet var subTable:UITableView!
    @IBOutlet var tableHeight:NSLayoutConstraint!
    @IBOutlet var inProcessStatus:UILabel!
    @IBOutlet var countLbl:UILabel!
    @IBOutlet var arrowImage:UIImageView!
    var fromPending = false
    var selectedIndexPath:NSIndexPath? = nil
    var indexArr = ["0","0"]
    var pendingArr = ["In-Time","Default"]
    var pendingCountArr = [Int]()
    var referanceClass:UserInprocessViewController?
    var navigationStr = ""
    var commonArr = [[InProcessData]]()
    var purposeID = ""
    var serviceTitleStr = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        subTable.delegate = self
        subTable.dataSource = self
        subTable.register(UINib(nibName: "InProcessPendingTableViewCell", bundle: nil), forCellReuseIdentifier: "InProcessPendingTableViewCell")
       // subTable.register(UINib(nibName: "InProcessCommonTableViewCell", bundle: nil), forCellReuseIdentifier: "InProcessCommonTableViewCell")
        
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
extension InProcessPendingSecondTableViewCell:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if commonArr.count == 0{
            return 0
        }
        return pendingArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "InProcessPendingTableViewCell", for: indexPath) as!
            InProcessPendingTableViewCell
        cell.purposeID = purposeID
        cell.referanceClass = referanceClass
        cell.serviceTitleStr = serviceTitleStr
        cell.inProcessStatus.text = pendingArr[indexPath.row]
        cell.countLbl.text =  ":  \(pendingCountArr[indexPath.row])"
        cell.commonArr = commonArr[indexPath.row]
        cell.navigationStr = navigationStr
        if indexArr[indexPath.row] == "0" {
            cell.subTable.isHidden = true
            cell.arrowImage.image = UIImage(named: "downarrow")
        }else{
            cell.subTable.isHidden = false
            cell.arrowImage.image = UIImage(named: "arrow-black")
        }
            cell.selectionStyle = .none
            return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexValue = indexArr[indexPath.row]
        indexArr = indexArr.map({ $0.replacingOccurrences(of: "1", with: "0") })
        if indexValue == "1"{
            indexArr[indexPath.row] = "0"
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name("Height"), object: nil)
           
        }
        else{
            indexArr[indexPath.row] = "1"
            NotificationCenter.default.post(name: NSNotification.Name("Height"), object: nil)
          
        }
        switch selectedIndexPath {
            
        case nil:
            selectedIndexPath = indexPath as NSIndexPath
            
        default:
            
            if selectedIndexPath! as IndexPath  == indexPath {
                
                selectedIndexPath = nil
                
            } else {
                
                selectedIndexPath = indexPath as NSIndexPath
            }
            
        }
        navigationStr = "In Process" + "->" + "Pending" +  "->" +  pendingArr[indexPath.row]
//       let cell =  tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0)) as! InProcessPendingTableViewCell
//        cell.tagIndex = indexPath.row
//       // cell.subTable.reloadData()
      //  tableView.reloadRows(at: [indexPath], with: .none)
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let smallHeight1: CGFloat = 55
            let smallHeight2: CGFloat = UITableView.automaticDimension
                   let ip = indexPath
                  if selectedIndexPath != nil {
                       if ip == selectedIndexPath! as IndexPath {
       
                           return smallHeight2
       
                       }else{
                           return smallHeight1
                       }
                   }else{
                       return smallHeight1
                   }
    }
}
