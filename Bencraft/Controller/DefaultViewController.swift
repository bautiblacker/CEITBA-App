//
//  DefaultViewController.swift
//  Bencraft
//
//  Created by Martin Craviotto on 10/29/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit

class DefaultViewController: UIViewController {
    
    var legajo: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let legajo = legajo {
            print("El legajo es \(legajo)")
        } else {
            print("No hay legajo!")
        }

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
//        if let destination = segue.destination as? SeleccionModoDeJuegoView {
//            destination.jugadores = players
//            destination.cantPlayers = cantPlayers
//        }
        
    }
}
