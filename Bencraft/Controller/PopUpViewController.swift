//
//  PopUpViewController.swift
//  Bencraft
//
//  Created by Bauti Blacker on 12/3/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   @objc func confirmAction(sender: UIButton) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let popupVC = storyboard.instantiateViewController(withIdentifier: "hello") as! PopUpViewController
        popupVC.modalPresentationStyle = .popover
        popupVC.preferredContentSize = CGSize(width: 300, height: 300)
        let pVC = popupVC.popoverPresentationController
        pVC?.permittedArrowDirections = .any
        pVC?.delegate = self
        pVC?.sourceView = sender
        pVC?.sourceRect = CGRect(x: 100, y: 100, width: 1, height: 1)
        present(popupVC, animated: true, completion: nil)
        popupVC.modalPresentationStyle = .overCurrentContext
        popupVC.modalTransitionStyle = .crossDissolve
    }

}
