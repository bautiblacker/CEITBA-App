//
//  SpecificBenefitCell.swift
//  Bencraft
//
//  Created by Bauti Blacker on 9/6/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit

class SpecificBenefitCell: UICollectionViewCell {
    
//    @IBOutlet weak var featuredButton: UIButton!
        
//    @IBOutlet weak var benefitDescription: UILabel!
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var information: UILabel!
    
    var benefit: Benefits? {
        didSet {
            self.updateUI()
        }
    }
    
    
    fileprivate func updateUI() {
        if let benefit = benefit {
            featuredImageView.image = benefit.featuredImage
//            benefitDescription.text = benefit.description
        } else {
            featuredImageView.image = nil
//            benefitDescription.text = nil
            
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 3.0
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 10, height: 10)
        self.clipsToBounds = true
    }
    
}
