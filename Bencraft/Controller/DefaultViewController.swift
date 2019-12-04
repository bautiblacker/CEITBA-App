//
//  DefaultViewController.swift
//  Bencraft
//
//  Created by Martin Craviotto on 10/29/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DefaultViewController: UIViewController {
    
    var legajo: String!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton! {
        didSet {
            logOutButton.addTarget(LogInController(), action: #selector(changeStatus), for: UIControl.Event.touchUpInside)
            let defaults:UserDefaults = UserDefaults.standard
            defaults.set(false, forKey: "isRemembered")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let legajo = legajo {
            print("El legajo es \(legajo)")
            loadName()
        } else {
            print("No hay legajo!")
        }

        // Do any additional setup after loading the view.
    }
    
    @objc func changeStatus() {
        let defaults: UserDefaults? = UserDefaults.standard
        defaults?.set(false, forKey: "isRemembered")
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destination = segue.destination as? BenefitsViewController {
            destination.category = segue.identifier!
        }
        
    }
    
    func loadName() {
        let ref = Database.database().reference()
        let string = "usuarios/\(legajo ?? "")/nombre"
        
        ref.child(string).observeSingleEvent(of: .value)
        { (snapshot) in
            let nombre = snapshot.value as! String
            self.nameLabel.text = nombre
        }
    }
}
