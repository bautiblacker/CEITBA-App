//
//  Benefit.swift
//  Bencraft
//
//  Created by Bauti Blacker on 9/6/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit

class Benefit {
    var description = ""
    var featuredImage: UIImage
    
    init(description: String, featuredImage: UIImage) {
        self.description = description
        self.featuredImage = featuredImage
    }
    
    static func fetchBenefits() -> [Benefit] {
        return [
            Benefit(description: "McDonalds Cuarto de Libra", featuredImage: UIImage(named: "McDonalds1")!),
            Benefit(description: "McDonalds Combo", featuredImage: UIImage(named: "McDonalds2")!),
            Benefit(description: "Dandy", featuredImage: UIImage(named: "Dandy")!),
            Benefit(description: "BaguetteCo", featuredImage: UIImage(named: "BaguetteCo")!),
            Benefit(description: "Fridays!", featuredImage: UIImage(named: "Fridays-1")!),
            Benefit(description: "Central Market", featuredImage: UIImage(named: "central-market")!),
            Benefit(description: "Lolea", featuredImage: UIImage(named: "LOLEA-1")!),
        ]
    }
}
