//
//  BeneficiosEspecificosController.swift
//  Bencraft
//
//  Created by Martin Craviotto on 9/3/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit

class BeneficiosEspecificosController: UIViewController {
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        
//    }
    
    var delegate: HomeControllerDelegate?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            configureNavigationBar()
    //        addBenefits()
        }
        
        @objc func handleMenuToggle() {
            delegate?.handleMenuToggle(forMenuOption: nil)
        }
        
        func configureNavigationBar() {
            navigationController?.navigationBar.barTintColor = .darkGray
            navigationController?.navigationBar.barStyle = .black
            
            navigationItem.title = "CEITBA"
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
        }
    
    
}
