//
//  DashboardViewController.swift
//  MineMitra
//
//  Created by Swamy on 28/04/22.
//

import UIKit

class DashboardViewController: UIViewController {
    @IBOutlet  var sideMenuView: UIView!
    @IBOutlet  var menuTbl: UITableView!
    @IBOutlet weak var deshabordCollection: UICollectionView!
    @IBOutlet  var homeView: UIView!
    @IBOutlet  var supportView: UIView!
    @IBOutlet  var aboutUsView: UIView!
    @IBOutlet  var profileView: UIView!
    @IBOutlet  var sideView: UIView!
    @IBOutlet  var floatingView: UIView!
    @IBOutlet var firstLbl:UILabel!
    @IBOutlet var secondLbl:UILabel!
    @IBOutlet weak var aboutView: UIScrollView!
    
    @IBOutlet weak var topLbl: UILabel!
    var menuImages = ["main_bg_1","main_bg_2","main_bg_3","main_bg_4","main_bg_5","main_bg_6"]
    var menuArr = ["Profile","Messaging","Logout"]
    override func viewDidLoad() {
        super.viewDidLoad()
        floatingView.setRoundedView()
        addGestures()
        sideView.setRoundedView()
        secondLbl.text = SECOND_TITLE
        firstLbl.text = FIRST_TITLE
        
        topLbl.text = "Directorate of Geology & Mining, UP, from its inception in 1955 is actively engaged in search of mineral wealth as promotion of scientific development of mineral resources along with conservation and development of mineral based industries in the state." + "\n" + "\n" +  "All activities of the department are being spearheaded from its headquarters at Lucknow and Regional Offices based at Jhansi, Prayagraj, Agra, Sonbhadra, Ayodhya, Bareilly, Gorakhpur, Ghaziabad and Lucknow." + "\n" + "\n" + "The Directorate aims to provide access of mineral for sustainable economic growth, equal benefit and prosperity to all the citizens of Uttar Pradesh and to formulate policies that effectively regulate activities in the Mining and Geology sector."
    }
    @objc func openTable(){
        if menuTbl.isHidden{
            menuTbl.isHidden = false
        }else{
            menuTbl.isHidden = true
        }
    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        self.updateViewConstraints()
//        self.aboutTbl.layoutTableHeaderView()
//    }
    
   
    
    
    @IBAction func supportTap(_ sender: Any) {
        supportAction()
    }
    
    
    func addGestures(){
        homeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(homeAction)))
        aboutUsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(aboutAction)))
        profileView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(profileAction)))
        floatingView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(getStartedAction)))
        sideMenuView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openTable)))
    }
    
    @objc func homeAction(){
        aboutView.isHidden = true
        deshabordCollection.isHidden = false
    }
    @objc func supportAction(){
        let objVC = self.storyboard?.instantiateViewController(withIdentifier: "SupportViewController") as! SupportViewController
        objVC.view.frame = self.view.frame
       
        self.view.addSubview(objVC.view)
        self.addChild(objVC)
        
    }
    
    @objc func getStartedAction(){
        let objVC = self.storyboard?.instantiateViewController(withIdentifier: "GetStartedViewController") as! GetStartedViewController
        objVC.view.frame = self.view.frame
        self.view.addSubview(objVC.view)
        self.addChild(objVC)
        
    }
    
    @objc func aboutAction(){
       // if aboutTbl.isHidden {
        aboutView.isHidden = false
            deshabordCollection.isHidden = true
//        }else{
//            aboutTbl.isHidden = true
//            deshabordCollection.isHidden = false
//        }
        
    }
    @objc func profileAction(){
        Utility.goToViewController(controllerID: "UserProfileViewController", viewController: self)
    }
    
   
}
extension DashboardViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardCell", for: indexPath) as! DashboardCell
        cell.serviceImg.image = UIImage(named: menuImages[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width/2 - 5 , height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0{
        Utility.goToViewController(controllerID: "ServicesForCitizenViewController", viewController: self)
        }else if indexPath.item == 2{
            if let url = URL(string: "https://play.google.com/store/apps/details?id=com.margsoft.m_check") {
                UIApplication.shared.open(url)
            }
        }else{
            Toast.show(message: "Coming Soon", controller: self)
        }
    }
    
    
}
extension DashboardViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuArr[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            Utility.goToViewController(controllerID: "UserProfileViewController", viewController: self)
        }else if indexPath.row == 1{
            Toast.show(message: "Coming Soon", controller: self)
        }else{
            UserDefaults.standard.removeObject(forKey: "isLogin")
            Utility.goToViewController(controllerID: "SelectRoleViewController", viewController: self)
        }
    }
    
    
}
class DashboardCell:UICollectionViewCell{
    @IBOutlet var serviceImg:UIImageView!
}
