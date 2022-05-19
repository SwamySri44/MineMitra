//
//  SelectRoleViewController.swift
//  MineMitra
//
//  Created by Vemulawada Swamy on 29/04/22.
//

import UIKit

class SelectRoleViewController: UIViewController {
    @IBOutlet var roleTF:UITextField!
    var roleArr = ["DGM","DM","MO","Tehsildar","Licensee","Lessee","Transporter","Applicant"]
    let picker = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        Utility.textFieldPadding(TF: roleTF)
        roleTF.inputView = picker
        picker.delegate = self
        roleTF.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(selectFirstRow))
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    @IBAction func proceedAction(_ sender:UIButton){
        self.view.endEditing(true)
        if roleTF.text == ""{
            Toast.show(message: "Please choose a option.", controller: self)
        }else{
            if roleTF.text != "DGM"{
                Toast.show(message: "Coming Soon.", controller: self)
            }else{
                Utility.goToViewController(controllerID: "LoginViewController", viewController: self)
            }
        }
      
    }

    @objc func  selectFirstRow(){
        if roleTF.text == ""{
            roleTF.text = roleArr[0]
        }
    }

}
extension SelectRoleViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    //PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        roleArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return roleArr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        roleTF.text = roleArr[row]
       
    }
}
