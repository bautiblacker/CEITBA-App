//
//  createAccountController.swift
//  Bencraft
//
//  Created by Bauti Blacker on 12/3/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit
import FirebaseDatabase

class createAccountController: UIViewController {
    @IBOutlet weak var txtName: UITextField!{
        didSet {
            txtName.setIcon(#imageLiteral(resourceName: "user-icon"), #imageLiteral(resourceName: "separator-icon") )
        }
    }
    @IBOutlet weak var txtSurname: UITextField!{
        didSet {
            txtSurname.setIcon(#imageLiteral(resourceName: "user-icon"), #imageLiteral(resourceName: "separator-icon") )
        }
    }
    @IBOutlet weak var txtLegajo: UITextField!{
        didSet {
            txtLegajo.setIcon(#imageLiteral(resourceName: "user-icon"), #imageLiteral(resourceName: "separator-icon") )
        }
    }
    @IBOutlet weak var txtEmail: UITextField!{
        didSet {
            txtEmail.setIcon(#imageLiteral(resourceName: "user-icon"), #imageLiteral(resourceName: "separator-icon") )
        }
    }
    @IBOutlet weak var txtPassword: UITextField!{
        didSet {
            txtPassword.setIcon(#imageLiteral(resourceName: "user-icon"), #imageLiteral(resourceName: "separator-icon") )
        }
    }
    @IBOutlet weak var txtRPassword: UITextField!{
        didSet {
            txtRPassword.setIcon(#imageLiteral(resourceName: "user-icon"), #imageLiteral(resourceName: "separator-icon") )
        }
    }
    
    func validateInfo() {
        let ref = Database.database().reference()
        let name = txtName.text ?? ""
        let password = txtPassword.text ?? ""
        let email = txtEmail.text ?? ""
        let data = ["nombre": name, "mail": email, "contraseña": password]
        let legajo = txtLegajo.text ?? ""
        
        let id:String = "\(legajo)/"
        print(ref.child("usuarios/"))
            
        ref.child("usuarios/").setValue(id)
        ref.child("usuarios/").child(id).setValue(data)
        
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "accountCreatedSuccesfully" {
            validateInfo()
        }
        return false
    }
    
    
}
