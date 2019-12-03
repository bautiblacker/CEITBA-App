//
//  ViewController.swift
//  Bencraft
//
//  Created by Martin Craviotto on 8/30/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit
import FirebaseDatabase

class LogInController: UIViewController {
    
    var legajo: String?
    
    @IBOutlet weak var txtUser: UITextField!{
        didSet {
            txtUser.setIcon(#imageLiteral(resourceName: "user-icon"), #imageLiteral(resourceName: "separator-icon") )
            
        }
    }
    @IBOutlet weak var txtPassword: UITextField!{
        didSet {
            txtPassword.setIcon(#imageLiteral(resourceName: "lock-icon"), #imageLiteral(resourceName: "separator-icon") )
            
        }
    }
    @IBOutlet weak var rememberSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         rememberSwitch.addTarget(self, action: #selector(stateChanged), for: .valueChanged)
                let defaults: UserDefaults? = UserDefaults.standard

        // check if defaults already saved the details

        if defaults?.bool(forKey: "ISRemember") ?? false {
            txtUser.text = defaults?.value(forKey: "SavedUserName") as? String
            txtPassword.text = defaults?.value(forKey: "SavedPassword") as? String
            rememberSwitch.setOn(true, animated: false)
            self.shouldPerformSegue(withIdentifier: "LogInSuccessfully", sender: self)
        } else {
            rememberSwitch.setOn(false, animated: false)
        }
        // Do any additional setup after loading the view.

    }
    
    @objc func stateChanged(_ switchState: UISwitch) {

    let defaults: UserDefaults? = UserDefaults.standard
        if switchState.isOn {
        defaults?.set(true, forKey: "ISRemember")
        defaults?.set(txtUser.text, forKey: "SavedUserName")
        defaults?.set(txtPassword.text, forKey: "SavedPassword")
    }
    else {
        defaults?.set(false, forKey: "ISRemember")
        }
    }
    
    func validateAccount() {
        let ref = Database.database().reference()
        legajo = txtUser.text
        let string = "usuarios/\(legajo ?? "")/contraseña"
        print("Legajo: \(legajo ?? "")")
        print("Contraseña ingresada: \(txtPassword.text ?? "")")
        
        ref.child(string).observeSingleEvent(of: .value)
        { (snapshot) in
            let password = snapshot.value as! String
            print("Contraseña correcta: \(password)")
            let login = password == self.txtPassword.text
            print("El resultado es: \(login)")
            if login {
                self.performSegue(withIdentifier: "LogInSuccessfully", sender: self)
            } else {
                self.invalidLogIn()
            }
        }
    }
    
    func invalidLogIn() {
        let alert = UIAlertController(title: "Los datos ingresados son incorrectos.", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Reintentar", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
                if identifier == "LogInSuccessfully" {
                    validateAccount()
                }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DefaultViewController {
            destination.legajo = legajo
        }
    }
}

extension UITextField {
    func setIcon(_ image1: UIImage,_ image2: UIImage){
        let iconView1 = UIImageView(frame:
            CGRect(x: 10, y:5, width: 20, height: 20))
        iconView1.image = image1
        let iconView2 = UIImageView(frame:
            CGRect(x: 26, y:5, width: 20, height: 20))
        iconView2.image = image2
        let iconContainerView: UIView = UIView(frame:
            CGRect(x:10, y:0, width:40, height:33))
        iconContainerView.addSubview(iconView1)
        iconContainerView.addSubview(iconView2)
        leftView = iconContainerView
        leftViewMode = .always
    }
}

@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
