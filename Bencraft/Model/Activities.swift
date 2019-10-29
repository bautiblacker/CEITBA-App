//
//  Activities.swift
//  Bencraft
//
//  Created by Nacho Grasso on 29/10/2019.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit

class Activity {
    var name : String
    var description : String
    
    init(name : String, description: String ) {
        self.name = name
        self.description = description
    }
}


class Activities {
    var activities = [Activity]()
}



