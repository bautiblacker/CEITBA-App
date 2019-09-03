//
//  BenefitsOption.swift
//  Bencraft
//
//  Created by Martin Craviotto on 9/3/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit

enum BenefitOption: Int, CustomStringConvertible {
    
    case Comida
    case Bares
    case Gym
    case Otros
    
    var description: String {
        switch self {
        case .Comida: return "COMIDA"
        case .Bares: return "BARES"
        case .Gym: return "GYM"
        case .Otros: return "OTROS"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Comida: return UIImage(named: "ic_person_outline_white_2x") ?? UIImage()
        case .Bares: return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        case .Gym: return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        case .Otros: return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        }
    }
    
}
