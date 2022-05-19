//
//  SupportViewController.swift
//  MineMitra
//
//  Created by Swamy on 30/04/22.
//

import UIKit

class SupportViewController: UIViewController {
    @IBOutlet var callImg:UIImageView!
    @IBOutlet var whatsappImg:UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        callImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(callAction)))
    whatsappImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(whatsAppAction)))
    }
    
    @objc func callAction(){
        if let url = NSURL(string: "tel://8887534721") {
            UIApplication.shared.openURL(url as URL)
        }
    }
    
    @objc func whatsAppAction(){
        let whatsappURL = URL(string: "https://api.whatsapp.com/send?phone=9120007826&text=MineMitra")
        if UIApplication.shared.canOpenURL(whatsappURL!) {
            UIApplication.shared.open(whatsappURL!, options: [:], completionHandler: nil)
            }
    }
    @IBAction func closeAction(_ sender:UIButton){
        self.view.removeFromSuperview()
        self.removeFromParent()
    }

 

}
