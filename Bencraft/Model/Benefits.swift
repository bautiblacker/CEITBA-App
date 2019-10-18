//
//  Benefits.swift
//  Bencraft
//
//  Created by Bauti Blacker on 9/8/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit

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
}
