//
//  Usuarios.swift
//  Bencraft
//
//  Created by Nacho Grasso on 03/12/2019.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import Foundation

public struct Usuario: Codable{
    public let actividades:Array<String>
    public let contraseña:String
    public let mail:String
    public let nombre:String
    
}
