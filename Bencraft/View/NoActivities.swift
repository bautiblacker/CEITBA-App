//
//  NoActivities.swift
//  Bencraft
//
//  Created by Nacho Grasso on 03/12/2019.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit

class NoActivities: UIView{
    
    let label = UILabel()
    
    func setup(){
        backgroundColor = UIColor.orange
        setupLabel()
    }
    func setupLabel(){
        label.text = "Add your activities."
        addSubview(label)
    }
    
    func layout(){
        layoutLabel()
    }
    
    func layoutLabel(){
        label.frame = CGRect(x:0, y:0, width:200, height: 40)
        label.center = self.center
    }
    
}
