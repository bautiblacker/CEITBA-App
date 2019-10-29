//
//  PartyKit.swift
//  Bencraft
//
//  Created by Bauti Blacker on 9/8/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit

class PartyKit: Benefits {
    let title = "Party Kit"
    
    override init(description: String, featuredImage: UIImage) {
        super.init(description: description, featuredImage: featuredImage)
    }
    
    static func fetchBenefits() -> [PartyKit] {
        return [
            PartyKit(description: "McDonalds Cuarto de Libra", featuredImage: UIImage(named: "McDonalds1")!),
            PartyKit(description: "McDonalds Combo", featuredImage: UIImage(named: "McDonalds2")!),
            PartyKit(description: "Dandy", featuredImage: UIImage(named: "Dandy")!),
            PartyKit(description: "BaguetteCo", featuredImage: UIImage(named: "BaguetteCo")!),
            PartyKit(description: "Fridays!", featuredImage: UIImage(named: "Fridays-1")!),
            PartyKit(description: "Central Market", featuredImage: UIImage(named: "central-market")!),
            PartyKit(description: "Lolea", featuredImage: UIImage(named: "LOLEA-1")!),
        ]
    }
}
