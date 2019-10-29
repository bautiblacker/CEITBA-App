//
//  Benefits.swift
//  Bencraft
//
//  Created by Bauti Blacker on 9/8/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit
import Firebase

class Benefits {
    var description = ""
    var featuredImage: UIImage
    
    init(description: String, featuredImage: UIImage) {
        self.description = description
        self.featuredImage = featuredImage
    }
    
    func fetchBenefits() -> [Benefits] {
        return [];
    }
    
//    var docRef: DocumentReference!
//    func setBenefit(type: String) {
//        FirebaseApp.configure()
//        let db = Firestore.firestore()
//        db.collection(type).getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
//                }
//            }
//        }
        
        
    //}
    
    
    
    
}
