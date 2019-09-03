//
//  MenuOption.swift
//  Bencraft
//
//  Created by Martin Craviotto on 9/3/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible {
    
    case Perfil
    case Actividades
    case Beneficios
    case Cursos
    case Deportes
    case Gym
    case Idiomas
    case Kit
    case Lab
    case Lockers
    case Contacto
    case Settings
    case LogOut
    
    var description: String {
        switch self {
        case .Perfil: return "Perfil"
        case .Actividades: return "Actividades"
        case .Beneficios: return "Beneficios"
        case .Cursos: return "Cursos"
        case .Deportes: return "Deportes"
        case .Gym: return "Gym"
        case .Idiomas: return "Idiomas"
        case .Kit: return "Kit Festejo"
        case .Lab: return "Lab"
        case .Lockers: return "Lockers"
        case .Contacto: return "Contacto"
        case .Settings: return "Configuraciones"
        case .LogOut: return "Cerrar Sesión"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Perfil: return UIImage(named: "ic_person_outline_white_2x") ?? UIImage()
        case .Actividades: return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        case .Beneficios: return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        case .Cursos: return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        case .Deportes: return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        case .Gym: return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        case .Idiomas: return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        case .Kit: return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        case .Lab: return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        case .Lockers: return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        case .Contacto: return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        case .Settings: return UIImage(named: "baseline_settings_white_24dp") ?? UIImage()
        case .LogOut: return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        }
    }

}
