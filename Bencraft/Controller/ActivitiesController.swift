//
//  ActivitiesController.swift
//  Bencraft
//
//  Created by Nacho Grasso on 29/10/2019.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit

import FirebaseCore
import FirebaseFirestore

class ActivitiesController : UIViewController {
    @IBOutlet weak var displayLbl: UILabel!
    
    var db: Firestore!

    override func viewDidLoad() {
        super.viewDidLoad()
        displayLbl.text = ""

        // [START setup]
        let settings = FirestoreSettings()

        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
        
        getMyActivities()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func getMyActivities()
    {

        db.collection("alum_act").document("57610").getDocument { (document, error) in
            if let document = document {
                let group_array = document["ins"] as? Array ?? [""]
                
                group_array.forEach{ activity in
                
                    self.db.collection("actividades").document(activity).getDocument{ (document, error) in
                    if let document = document {
                        let nombre = document.get("nombre") as? String ?? ""
                        let descripcion = document.get("Descripcion") as? String ?? ""
                       print(nombre)
                        self.displayLbl.text = "\(nombre)"
                        print(descripcion)
                        }
                
                    }

                }
            }

        }

    }
    
}
