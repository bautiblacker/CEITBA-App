//
//  Sports.swift
//  
//
//  Created by Bauti Blacker on 9/8/19.
//

import UIKit

class Sports: Benefits {
    
    let title = "Sports"
    
    override init(description: String, featuredImage: UIImage) {
        super.init(description: description, featuredImage: featuredImage)
    }
    
    static func fetchBenefits() -> [Sports] {
        return [
            Sports(description: "McDonalds Cuarto de Libra", featuredImage: UIImage(named: "McDonalds1")!),
            Sports(description: "McDonalds Combo", featuredImage: UIImage(named: "McDonalds2")!),
            Sports(description: "Dandy", featuredImage: UIImage(named: "Dandy")!),
            Sports(description: "BaguetteCo", featuredImage: UIImage(named: "BaguetteCo")!),
            Sports(description: "Fridays!", featuredImage: UIImage(named: "Fridays-1")!),
            Sports(description: "Central Market", featuredImage: UIImage(named: "central-market")!),
            Sports(description: "Lolea", featuredImage: UIImage(named: "LOLEA-1")!),
        ]
    }
}
