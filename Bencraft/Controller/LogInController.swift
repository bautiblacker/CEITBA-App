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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
//        let ref = Database.database().reference()
        
//        ref.child("userid").setValue("bla", forKey: "sss") Puedo setear/agregar valores a la DB asi
//        ref.child("userid").observeSingleEvent(of: .value)
//        { (snapshot) in
//            let name = snapshot.value as? String
        
        
//        } Asi puedo leer los valores de la DB
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


