//
//  ActivitiesController.swift
//  Bencraft
//
//  Created by Martin Craviotto on 10/29/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import Foundation
import FirebaseDatabase

class ActivitiesController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureUI()
    }
    
    
    func configureUI() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Activities"
        navigationController?.navigationBar.barStyle = .black
    }
}
