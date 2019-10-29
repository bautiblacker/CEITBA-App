//
//  BeneficiosEspecificosController.swift
//  Bencraft
//
//  Created by Martin Craviotto on 9/3/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit
import Firebase

class BenefitsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var benefits : [Sports] = Sports.fetchBenefits()
    let cellScaling: CGFloat = 0.6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScaling)
        let cellHeight = floor(screenSize.height * cellScaling)
        
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeight) / 2.0
        
        let layout = collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView?.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        
        collectionView?.dataSource = self
        collectionView.delegate = self
        
        var docRef: DocumentReference!
        docRef = Firestore.firestore().collection("deportes").document("basquet")
        docRef.getDocument { (docSnapshot, err) in
            guard let docSnapshot = docSnapshot, docSnapshot.exists else { return }
            let myData = docSnapshot.data()
            let sport = myData?["descripcion"] as? String ?? ""
            
        }
        
        
        
        
        
        
        
        
//        FirebaseApp.configure()
//        let db = Firestore.firestore()
//        db.collection("deportes").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
//                }
//            }
//        }
        }
    
    @IBAction func showBenefitInfo(_ sender: UIButton) {
        sender.backgroundColor = UIColor.blue
    }
    
//    @IBAction func featuredButton(_sender: UIButton) {
//        
//        information.isHidden = !information.isHidden
//        infoView.isHidden = !infoView.isHidden
//    }
    
//    func setBenefit(type: Benefits) {
//        benefits = type.fetchBenefits();
//    }
}

extension BenefitsViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return benefits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "benefitCell", for: indexPath) as! SpecificBenefitCell
        
        // cell.benefit = benefits[indexPath.item]
        cell.backgroundColor = UIColor.white
        
        return cell
    }
}

/* Extrension that stop benefits scrolling in one benefit */
extension BenefitsViewController : UIScrollViewDelegate, UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity
        velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        var offset = targetContentOffset.pointee
        let index = round((offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing) /*index*/
        
        offset = CGPoint(x: index * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}


