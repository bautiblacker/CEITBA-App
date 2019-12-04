//
//  createAccountView.swift
//  Bencraft
//
//  Created by Bauti Blacker on 12/3/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CreateAccountViewController: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtSurname: UITextField!
    @IBOutlet weak var txtLegajo: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtRPassword: UITextField!
    
    @IBAction func backToLogIn(_ sender: Any) {
        performSegue(withIdentifier: "backToLogIn", sender: self)
    }
    @IBOutlet weak var confirm: UIButton! {
        didSet {
            confirm.addTarget(self, action: #selector(confirmAction), for: UIControl.Event.touchUpInside)
        }
    }
    
    @objc func confirmAction() {
        validateInfo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
    
    @IBAction func didEndOnExit(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    func validateInfo() {
        let ref = Database.database().reference()
        let name = txtName.text ?? ""
        let surname = txtSurname.text ?? ""
        let password = txtPassword.text ?? ""
        let email = txtEmail.text ?? ""
        let legajo = txtLegajo.text ?? ""
        
        
        if verifyField(txtField: txtName) && verifyField(txtField: txtSurname) && verifyField(txtField: txtPassword) && verifyField(txtField: txtEmail) && verifyField(txtField: txtLegajo) && verifyPassword(password: txtPassword, rPassword: txtRPassword) {
            
            ref.child("usuarios").child(legajo).observeSingleEvent(of: .value)
            { (snapshot) in
                if snapshot.exists() {
                    print(snapshot)
                    self.performSegue(withIdentifier: "userAlreadyExists", sender: self)
                    return
                } else {
                    let fullname = name.uppercased() + " " + surname.uppercased()
                    let data = ["nombre": fullname, "mail": email, "contraseña": password, "actividades":""]
                    ref.child("usuarios").child(legajo).setValue(data)
                    self.performSegue(withIdentifier: "toConfirmedView", sender: self)
                }
            }
        }
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "userAlreadyExists" {
            print("HOLA")
        }
        return false
    }
    
    func verifyPassword(password: UITextField, rPassword: UITextField) -> Bool {
        if password.text != rPassword.text {
            password.layer.borderWidth = 2
            rPassword.layer.borderWidth = 2
            password.layer.borderColor = UIColor.red.cgColor
            rPassword.layer.borderColor = UIColor.red.cgColor
            return false
        }
        password.layer.borderWidth = 0
        rPassword.layer.borderWidth = 0
        password.layer.borderColor = UIColor.clear.cgColor
        rPassword.layer.borderColor = UIColor.clear.cgColor
        return true
    }
    
    func verifyField(txtField: UITextField) -> Bool {
        if(txtField.text == "") {
            txtField.layer.borderWidth = 2
            txtField.layer.borderColor = UIColor.red.cgColor
            return false
        }
        txtField.layer.borderWidth = 0
        txtField.layer.borderColor = UIColor.clear.cgColor
        return true
    }

}
