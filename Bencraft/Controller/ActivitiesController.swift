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
import FirebaseDatabase
import Promises

class ActivitiesController : UIViewController {
    @IBOutlet weak var displayLbl: UILabel!
    lazy var background: DispatchQueue = {
        return DispatchQueue.init(label: "background.queue", attributes: .concurrent)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.background.async {
            let act: Array<Activity> = Activity.getMyActivities()
            print(act)
            print(Activity.removeActivity(activityPath: "idiomas/Guarani"))
        }
    }
    
    
    
//
//    var db: Firestore!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //displayLbl.text = ""
//
//        // [START setup]
//        let settings = FirestoreSettings()
//
//        Firestore.firestore().settings = settings
//        // [END setup]
//        db = Firestore.firestore()
//
//        getMyActivities()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//  private func getMyActivities()
//  {
//
//        db.collection("alum_act").document("57610").getDocument { (document, error) in
//            if let document = document {
//                let group_array = document["ins"] as? Array ?? [""]
//
//                group_array.forEach{ activity in
//
//                    self.db.collection("actividades").document(activity).getDocument{ (document, error) in
//                    if let document = document {
//                        let nombre = document.get("nombre") as? String ?? ""
//                        let descripcion = document.get("Descripcion") as? String ?? ""
//                        print(nombre)
//                        print(descripcion)
//                        }
//                    }
//
//                }
//            }
//
//        }
//
//    }
    
//    private func getMyActivities()
//    {
//        var actArray = [Curso]()
//        let myActivities = db.collection("alum_act").document("57610")
//        myActivities.getDocument{ (document,err) in
//            if let document = document, document.exists{
//                let activities = document["ins"] as? Array ?? [""]
//                let allActivities = self.db.collection("actividades")
//
//                activities.forEach { activity in
//                    allActivities.document(activity).getDocument{ (document,err) in
//                        if let document = document, document.exists{
//                            let nombre = document.get("nombre") as? String ?? ""
//                            let descripcion = document.get("Descripcion") as? String ?? ""
//                            actArray.append(Curso(name:nombre,description: descripcion))
//                        }else{
//                            print("Document allActivities does not exist")
//                        }
//                    }
//                }
//            }else{
//                print("Document myActivities does not exist")
//            }
//        }
//
//    }
    

    
}

